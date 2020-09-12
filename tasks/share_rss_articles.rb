#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'sanitize'
require 'idobata'
require 'active_support/all'

Idobata.hook_url = ENV['IDOBATA_SHARE']
TIME_INTERVAL    = 10 # minutes
RSS_LIST         = [
# { title: "Name short title of the RSS", url: "URL of RSS to fetch and share with team" },
  { title: 'YassLab',   label: "info",    url: "https://b.hatena.ne.jp/YassLab/rss"},
  { title: 'Qiita',     label: 'success', url: 'https://qiita.com/organizations/yasslab/activities.atom'},
  { title: 'TechRacho', label: 'warning', url: "https://techracho.bpsinc.jp/category/ruby-rails-related/feed"},
]


msg = ""
RSS_LIST.each { |rss|
  # NOTE: Set cron as "Every 10 minutes" in GitHub Actions to correspond
  if rss[:url].include? "qiita.com" # Atom feed that ends with '*.atom'
    articles = RSS::Parser.parse(rss[:url], false).items.select do |item|
      # NOTE: This feed doesn't contain timezone, so need to convert it into JST (+09:00)
      (Time.now - (item.published.content - 9.hours)) < TIME_INTERVAL * 60 # seconds
    end
  else # RSS feed that ends with '*.rss'
    articles = RSS::Parser.parse(rss[:url]).items.select do |item|
      # Time comparision by seconds (integer)
      (Time.now.round - item.date).to_i < TIME_INTERVAL * 60 # seconds
    end
  end

  msg << articles.map {|a|
    if rss[:url].include? 'b.hatena.ne.jp'
      p "<a href='#{a.link}'>#{a.title}</a> by <span class='label label-#{rss[:label]}'>#{rss[:title]}</span><br> #{a.description}"
    elsif rss[:url].include? "qiita.com"
      p "<a href='#{a.link.href}'>#{a.title.content}</a> by <a href='https://qiita.com/#{a.author.name.content}'>#{a.author.name.content}</a> <span class='label label-#{rss[:label]}'>Qiita</span>"
    else # e.g. TechRacho articles
      p "<a href='#{a.link}'>#{a.title}</a> by <span class='label label-#{rss[:label]}'>#{rss[:title]}</span><br> #{Sanitize.fragment(a.description)[0..110] + '...'}"
    end
  }.join("<br>")
}

if msg.empty?
  puts "✅ No recent updates ;)"
else
  puts "🆕 Found new article(s)."
  Idobata::Message.create(source: msg, format: :html) unless msg.empty?
end
