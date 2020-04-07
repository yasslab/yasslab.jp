#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'mechanize'

# How many articles you want to output? (Default: 3)
number_of_fetching_articles = (ARGV[0] || '3').to_i

#YASSLAB_NOTE_RSS = 'https://note.com/yasslab/rss'
YASSLAB_NOTE_RSS = 'note_yasslab.rss' # for debugging
rss = RSS::Parser.parse(YASSLAB_NOTE_RSS, false)

# Parse RSS and get yaml text
rss.items.each_with_index do |item, index|
  break if index >= number_of_fetching_articles
  title_emoji = Mechanize.new.get(item.link).title[0]

  puts <<YAML_TEXT
- title: #{title_emoji + item.title}
  date:  #{item.pubDate.strftime("%Y-%m-%d")}
  url:   #{item.link}

YAML_TEXT
end


