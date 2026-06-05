#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'yaml'
require 'mechanize'
require 'fileutils'
require 'uri'
require 'date'

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
  extension = File.extname(URI(image_url).path).downcase
  return extension if %w[.jpg .jpeg .png .webp .gif].include?(extension)

  '.jpg'
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

def backfill_range(option)
  case option.to_s
  when ''
    nil
  when /\Aall\z/i
    (0..)
  when /\A(\d+)\z/
    (0...Regexp.last_match(1).to_i)
  when /\A(\d+)(?:\.\.|-)(\d+)\z/
    (Regexp.last_match(1).to_i - 1)..(Regexp.last_match(2).to_i - 1)
  else
    raise ArgumentError, "Invalid cover range: #{option.inspect}. Use 10, 11..40, 11-40, or all."
  end
end

def backfill_note_images(agent, range)
  return 0 unless range

  content = IO.read(NEWS_YAML)
  backfilled_count = 0
  article_index = -1

  updated_content = content.split(/\n{2,}(?=- title:)/).map do |block|
    article_index += 1
    next block unless range.cover?(article_index)

    url = block[/^\s+url:\s+(.+)$/, 1]&.strip
    next block unless url&.start_with?('https://note.com/yasslab/')

    current_cover = block[/^\s+cover:\s+['"]?([^'"\n]+)['"]?$/, 1]&.strip
    next block if current_cover&.start_with?('/')

    source_cover = current_cover || note_image_url(agent, url)
    cover = local_note_image(agent, url, source_cover)
    next block unless cover

    backfilled_count += 1
    if current_cover
      block.sub(/^(\s+cover:\s+).+$/, "\\1#{yaml_single_quote(cover)}")
    else
      block.sub(/^(\s+url:\s+.+)$/, "\\1\n  cover: #{yaml_single_quote(cover)}")
    end
  end.join("\n\n")

  IO.write(NEWS_YAML, updated_content) if backfilled_count.positive?
  backfilled_count
end

number_of_articles_arg = ARGV[0]
cover_range_arg = ARGV[1]

# How many articles you want to output? (Default: 3)
number_of_fetching_articles = (number_of_articles_arg || '3').to_i
cover_backfill_range = backfill_range(cover_range_arg)

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

  cover = local_note_image(agent, item.link, note_image_url(agent, item.link))
  cover_line = cover ? "  cover: #{yaml_single_quote(cover)}\n" : ''

  news << <<~NEW_ARTICLE
    - title: #{yaml_single_quote(item.title)}
      date:  #{item.pubDate.strftime("%Y-%m-%d")}
      url:   #{item.link}
    #{cover_line}

    NEW_ARTICLE
end

backfilled_count = backfill_note_images(agent, cover_backfill_range)

if news.empty?
  puts "✅ No articles recently published."
else
  puts "🆕 Found new article(s)."
  IO.write(NEWS_YAML, news + IO.read(NEWS_YAML))
end

puts "🖼️ Backfilled #{backfilled_count} cover(s)." if backfilled_count.positive?
