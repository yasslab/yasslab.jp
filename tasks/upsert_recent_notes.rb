#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'yaml'
require 'mechanize'

NEWS_YAML = '_data/news.yml'

# How many articles you want to output? (Default: 3)
number_of_fetching_articles = (ARGV[0] || '3').to_i

YASSLAB_NOTE_RSS = 'https://note.com/yasslab/rss'
rss = RSS::Parser.parse(YASSLAB_NOTE_RSS, false)

# Parse RSS and get yaml text
urls = YAML.load_file(NEWS_YAML).map{|h| h['url']}
news = ''
rss.items.each.with_index(1) do |item, index|
  break if index >= number_of_fetching_articles
  next  if urls.include? item.link

  news << <<~NEW_ARTICLE
    - title: '#{item.title}'
      date:  #{item.pubDate.strftime("%Y-%m-%d")}
      url:   #{item.link}

    NEW_ARTICLE
end

if news.empty?
  puts "✅ No articles recently published."
else
  puts "🆕 Found new article(s)."
  IO.write(NEWS_YAML, news + IO.read(NEWS_YAML))
end
