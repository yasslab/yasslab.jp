#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'idobata'

Idobata.hook_url = ENV['IDOBATA_SHARE']
HATEBU_USERS = [
  "YassLab",
  # "Other Username"
]

msg = ""
HATEBU_USERS.each { |user|
  # Flush cache RSS before downloading
  #`curl -H 'Pragma: no-cache' -L b.hatena.ne.jp/#{user}/bookmark.rss`
  #`curl -o 'hatebu.rss' b.hatena.ne.jp/#{user}/bookmark.rss`
  rss = RSS::Parser.parse("https://b.hatena.ne.jp/#{user}/rss")

  # NOTE: Set cron as "Every 30 minutes" in GitHub Actions to correspond
  bookmarks = rss.items.select do |item|
    (Time.now - item.date) / 60 <= 30
  end

  msg << bookmarks.map {|b|
    p "<a href='#{b.link}'>#{b.title}</a> by <span class='label label-info'>#{user}</span><br /> #{b.description}"
  }.join("<br/>")
}

if msg.empty?
  puts "No recent updates ;)"
  puts ""
else
  Idobata::Message.create(source: msg, format: :html) unless msg.empty?
end

