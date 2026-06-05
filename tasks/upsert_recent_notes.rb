#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'yaml'
require 'mechanize'
require 'fileutils'
require 'uri'

NEWS_YAML = '_data/news.yml'
NEWS_IMAGE_DIR = 'img/news'
NEWS_IMAGE_PATH = '/img/news'

def yaml_single_quote(value)
  "'#{value.to_s.gsub("'", "''")}'"
end

def load_news_yaml
  if YAML.respond_to?(:unsafe_load_file)
    YAML.unsafe_load_file(NEWS_YAML)
  else
    YAML.load_file(NEWS_YAML)
  end
end

def note_image_url(agent, url)
  page = agent.get(url)
  page.at('meta[property="og:image"]')&.[]('content') ||
    page.at('meta[name="twitter:image"]')&.[]('content')
rescue => e
  warn "⚠️ Failed to fetch cover from #{url}: #{e.message}"
  nil
end

def note_key(url)
  URI(url).path.split('/').last
rescue URI::InvalidURIError
  nil
end

def image_extension(image_url)
  ext = File.extname(URI(image_url).path).downcase
  %w[.jpg .jpeg .png .webp .gif].include?(ext) ? ext : '.jpg'
rescue URI::InvalidURIError
  '.jpg'
end

def download_note_image(agent, note_url, image_url)
  key = note_key(note_url)
  return nil unless key && image_url

  filename = "note-#{key}#{image_extension(image_url)}"
  file_path = File.join(NEWS_IMAGE_DIR, filename)
  public_path = "#{NEWS_IMAGE_PATH}/#{filename}"

  return public_path if File.exist?(file_path)

  FileUtils.mkdir_p(NEWS_IMAGE_DIR)
  image_data = agent.get_file(image_url)
  File.open(file_path, File::WRONLY | File::CREAT | File::EXCL, 0o644) do |file|
    file.binmode
    file.write(image_data)
  end

  public_path
rescue Errno::EEXIST
  public_path
rescue => e
  warn "⚠️ Failed to save cover from #{image_url}: #{e.message}"
  nil
end

def local_note_image(agent, note_url, image_url)
  return image_url if image_url&.start_with?('/')

  download_note_image(agent, note_url, image_url)
end

# How many articles you want to output? (Default: 3)
number_of_fetching_articles = (ARGV[0] || '3').to_i

YASSLAB_NOTE_RSS = 'https://note.com/yasslab/rss'
rss = RSS::Parser.parse(YASSLAB_NOTE_RSS, false)
agent = Mechanize.new
agent.user_agent_alias = 'Mac Safari'

# Parse RSS and get yaml text
urls = load_news_yaml.map{|h| h['url']}
news = ''
rss.items.each.with_index(1) do |item, index|
  break if index > number_of_fetching_articles
  next  if urls.include? item.link

  local_note_image(agent, item.link, note_image_url(agent, item.link))

  news << <<~NEW_ARTICLE
    - title: #{yaml_single_quote(item.title)}
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
