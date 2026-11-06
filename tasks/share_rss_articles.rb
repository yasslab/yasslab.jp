#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'retryable'
require 'sanitize'
require 'slack/incoming/webhooks'
require 'active_support/all'

TIME_INTERVAL    = 60 # minutes
RSS_LIST         = [
# { title: "Name short title of the RSS", url: "URL of RSS to fetch and share with team" },
  { title: 'Hatena Bookmark', url: 'https://b.hatena.ne.jp/YassLab/rss'},
  { title: 'Qiita',           url: 'https://qiita.com/organizations/yasslab/activities.atom'},
  { title: 'TechRacho',       url: "https://techracho.bpsinc.jp/category/ruby-rails-related/feed"},
]

# NOTE: Ruby Weekly's pubDate is fixed at 00:00 UTC and the issue appears in the RSS later,
#       so the TIME_INTERVAL check never matches. Instead, remember the last posted issue
#       number (kept by actions/cache in GitHub Actions) and post issues newer than that.
RUBY_WEEKLY_RSS   = 'https://rubyweekly.com/rss/'
RUBY_WEEKLY_STATE = ENV.fetch('RUBY_WEEKLY_STATE', 'tmp/ruby_weekly_last_issue')

def ruby_weekly_issue_number(link)
  link.to_s[%r{/issues/(\d+)\z}, 1]&.to_i
end

# Returns issues newer than last_issue (oldest first).
# When nothing is remembered (first run or cache eviction), returns only the latest issue.
def new_ruby_weekly_items(items, last_issue)
  numbered = items.filter_map { |item|
    number = ruby_weekly_issue_number(item.link)
    [number, item] if number
  }.sort_by(&:first)
  return numbered.last(1).map(&:last) if last_issue.nil?
  numbered.select { |number, _| number > last_issue }.map(&:last)
end

# Each element is the list of article lines of one feed.
def slack_message(feeds)
  feeds.flatten.join("\n")
end

def last_ruby_weekly_issue(path)
  File.exist?(path) ? File.read(path).to_i : nil
end

def save_ruby_weekly_issue(path, number)
  FileUtils.mkdir_p(File.dirname(path))
  File.write(path, number.to_s)
end

if __FILE__ == $PROGRAM_NAME
  slack = Slack::Incoming::Webhooks.new ENV['SLACK_SHARE']

  feeds    = []
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

    feeds << articles.map {|a|
      if rss[:url].include? 'b.hatena.ne.jp'
        p "<#{a.link}|#{a.title}> by `<https://b.hatena.ne.jp/YassLab|#{rss[:title]}>`\n> #{a.description}"
      elsif rss[:url].include? "qiita.com"
        p "<#{a.link.href}|#{a.title.content}> by <https://qiita.com/#{a.author.name.content}|#{a.author.name.content}> `Qiita`"
      else # e.g. TechRacho articles
        p "<#{a.link}|#{a.title}> by `<https://techracho.bpsinc.jp/category/ruby-rails-related|#{rss[:title]}>`\n> #{Sanitize.fragment(a.description)[0..110] + '...'}"
      end
    }
  }

  # The description of Ruby Weekly is the whole newsletter HTML, so post only the title and link.
  weekly_items = Retryable.retryable(tries: 3, on: [Timeout::Error]) do
    new_ruby_weekly_items(RSS::Parser.parse(RUBY_WEEKLY_RSS, false).items, last_ruby_weekly_issue(RUBY_WEEKLY_STATE))
  end
  feeds << weekly_items.map { |a| p "<#{a.link}|#{a.title}> by `<https://rubyweekly.com/|Ruby Weekly>`" }
  msg = slack_message(feeds)

  if msg.empty?
    puts "✅ No recent updates ;)"
  else
    puts "🆕 Found new article(s)."
    slack.post msg
  end

  # Save after posting, so a failed post is retried in the next run.
  save_ruby_weekly_issue(RUBY_WEEKLY_STATE, ruby_weekly_issue_number(weekly_items.last.link)) if weekly_items.any?
end
