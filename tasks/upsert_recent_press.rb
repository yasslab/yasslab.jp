#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'yaml'
require 'mechanize'

# How many articles you want to output? (Default: 3)
# Note: '' is truthy in Ruby, so `(ARGV[0] || '3').to_i` would keep an empty
# Rake argument and evaluate to 0. Treat nil / empty string as the default.
def fetch_count(arg, default = 3)
  arg.to_s.empty? ? default : arg.to_i
end

if __FILE__ == $PROGRAM_NAME
  NEWS_YAML = '_data/press.yml'
  number_of_fetching_articles = fetch_count(ARGV[0])

  YASSLAB_PRESS_RSS = 'https://prtimes.jp/companyrdf.php?company_id=38934'
  rss = RSS::Parser.parse(YASSLAB_PRESS_RSS, false)

  # Parse RSS and get yaml text
  urls = YAML.load_file(NEWS_YAML).map{|h| h['url']}
  news = ''
  rss.items.each.with_index(1) do |item, index|
    break if index >= number_of_fetching_articles
    next  if urls.include? item.link

    news << <<~NEW_ARTICLE
      - title: '#{item.title}'
        date:  #{item.dc_date.strftime("%Y-%m-%d")}
        url:   #{item.link}

      NEW_ARTICLE
  end

  if news.empty?
    puts "✅ No press recently published."
  else
    puts "🆕 Found new press."
    IO.write(NEWS_YAML, news + IO.read(NEWS_YAML))
  end
end
