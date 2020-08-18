#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'idobata'

Idobata.hook_url = ENV['IDOBATA_SHARE']
RSS_LIST = [
# { title: "Name short title of the RSS", url: "URL of RSS to fetch and share with team" },
  { title: 'YassLab', url: "https://b.hatena.ne.jp/YassLab/rss"},
]

msg = ""
RSS_LIST.each { |rss|
  # NOTE: Set cron as "Every 30 minutes" in GitHub Actions to correspond
  articles = RSS::Parser.parse(rss[:url]).items.select do |item|
    (Time.now - item.date) / 60 < 30
  end

  msg << articles.map {|a|
    p "<a href='#{a.link}'>#{a.title}</a> by <span class='label label-info'>#{rss[:name]}</span><br> #{a.description}"
  }.join("<br>")
}

if msg.empty?
  puts "No recent updates ;)"
  puts ""
else
  Idobata::Message.create(source: msg, format: :html) unless msg.empty?
end

