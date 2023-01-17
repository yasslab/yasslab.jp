#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'retryable'
require 'sanitize'
require 'slack/incoming/webhooks'
require 'active_support/all'

slack            = Slack::Incoming::Webhooks.new ENV['SLACK_SHARE']
TIME_INTERVAL    = 30 # minutes
RSS_LIST         = [
# { title: "Name short title of the RSS", url: "URL of RSS to fetch and share with team" },
  { title: 'Ruby Weekly',     url: 'https://rubyweekly.com/rss/'},
  { title: 'Hatena Bookmark', url: 'https://b.hatena.ne.jp/YassLab/rss'},
  { title: 'Qiita',           url: 'https://qiita.com/organizations/yasslab/activities.atom'},
  { title: 'TechRacho',       url: "https://techracho.bpsinc.jp/category/ruby-rails-related/feed"},
]


msg = ""
articles = []
RSS_LIST.each { |rss|
  # Retry 3 times to HTTP connections at maximum
  Retryable.retryable(tries: 3, on: [Timeout::Error]) do
    # NOTE: Set TIME_INTERVAL value to cron scheduler in GitHub Actions to correspond this code.
    #       Passing 'false' to parse() means parsing the given RSS even if it is NOT valid RSS.
    if rss[:url].include? "qiita.com" # Atom feed that ends with '*.atom'
      articles = RSS::Parser.parse(rss[:url], false).items.select do |item|
        # NOTE: This feed doesn't contain timezone, so need to convert it into JST (+09:00)
        (Time.now.round - item.published.content + 9.hours) < TIME_INTERVAL * 60 # seconds
      end
    else # RSS feed that ends with '*.rss'
      articles = RSS::Parser.parse(rss[:url], false).items.select do |item|
        # Time comparision by seconds (integer)
        (Time.now.round - item.date).to_i < TIME_INTERVAL * 60 # seconds
      end
    end
  end

  msg << articles.map {|a|
    if rss[:url].include? 'b.hatena.ne.jp'
      p "<#{a.link}|#{a.title}> by `<https://b.hatena.ne.jp/YassLab|#{rss[:title]}>`\n> #{a.description}"
    elsif rss[:url].include? "qiita.com"
      p "<#{a.link.href}|#{a.title.content}> by <https://qiita.com/#{a.author.name.content}|#{a.author.name.content}> `Qiita`"
    elsif rss[:url].include? 'rubyweekly.com'
      p "<#{a.link}|#{a.title}> by `<https://rubyweekly.com/|#{rss[:title]}>`\n> #{a.description}"
    else # e.g. TechRacho articles
      p "<#{a.link}|#{a.title}> by `<https://techracho.bpsinc.jp/category/ruby-rails-related|#{rss[:title]}>`\n> #{Sanitize.fragment(a.description)[0..110] + '...'}"
    end
  }.join("\n")
}

if msg.empty?
  puts "✅ No recent updates ;)"
else
  puts "🆕 Found new article(s)."
  slack.post msg unless msg.empty?
end
