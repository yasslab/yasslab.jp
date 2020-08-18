#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'sanitize'
require 'idobata'

Idobata.hook_url = ENV['IDOBATA_SHARE']
RSS_LIST = [
# { title: "Name short title of the RSS", url: "URL of RSS to fetch and share with team" },
  { title: 'YassLab',   url: "https://b.hatena.ne.jp/YassLab/rss", label: "info"},
  { title: 'TechRacho', url: "https://techracho.bpsinc.jp/category/ruby-rails-related/feed", label: 'warning'},
]

msg = ""
RSS_LIST.each { |rss|
  # NOTE: Set cron as "Every 30 minutes" in GitHub Actions to correspond
  articles = RSS::Parser.parse(rss[:url]).items.select do |item|
    (Time.now - item.date) / 60 < 30
  end

  msg << articles.map {|a|
    if rss[:url].include? "hatena" # No needed to sanitize if Hatena bookmarks
      p "<a href='#{a.link}'>#{a.title}</a> by <span class='label label-#{rss[:label]}'>#{rss[:title]}</span><br> #{a.description}"
    else
      p "<a href='#{a.link}'>#{a.title}</a> by <span class='label label-#{rss[:label]}'>#{rss[:title]}</span><br> #{Sanitize.fragment(a.description)[0..110] + '...'}"
    end
  }.join("<br>")
}

if msg.empty?
  puts "No recent updates ;)"
  puts ""
else
  Idobata::Message.create(source: msg, format: :html) unless msg.empty?
end

