#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'yaml'
require 'mechanize'
require 'fileutils'
require 'uri'

NEWS_YAML = '_data/news.yml'
NEWS_IMAGE_DIR = 'img/news'

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

# note.com page titles look like "<title>｜YassLab 株式会社"; drop the company suffix.
def clean_note_title(raw)
  title = raw.to_s.strip
  title = title.rpartition('｜').first.strip if title.include?('｜')
  title.empty? ? nil : title
end

# Ensure a whitespace follows a leading emoji prefix, e.g. "📕Rails" -> "📕 Rails".
def normalize_title(str)
  return str if str.nil?
  clusters = str.grapheme_clusters
  run = 0
  run += 1 while clusters[run] && clusters[run].match?(/\p{S}/)
  return str if run.zero? || clusters[run].nil? || clusters[run].match?(/\p{Space}/)
  clusters.insert(run, ' ').join
end

# Fetch the English title note.com auto-translates when ?hl=en is appended.
def note_title_en(agent, url)
  clean_note_title(agent.get("#{url}?hl=en").title)
rescue => e
  warn "⚠️ Failed to fetch English title from #{url}: #{e.message}"
  nil
end

# note.com は公開後に記事タイトルを編集することがある。`url` で特定した
# エントリの title / title_en 行だけを書き換え、周囲の手書き YAML 整形
# （インデント・キーのスペース幅・空行・他と揃えたクォート）を保つ。
# title_en が nil のときは既存の title_en を変更しない。
def update_entry_titles(yaml_text, url:, title:, title_en:)
  lines = yaml_text.lines
  idx = lines.index { |line| line.match?(/\A\s*url:\s+#{Regexp.escape(url)}\s*\z/) }
  return yaml_text unless idx

  # ブロックは直前の空行の次から始まる。title / title_en は url より前にある。
  start = idx
  start -= 1 while start.positive? && !lines[start - 1].strip.empty?

  (start...idx).each do |i|
    if lines[i] =~ /\A(\s*(?:-\s+)?)title:\s/
      lines[i] = "#{$1}title: #{yaml_single_quote(title)}\n"
    elsif title_en && lines[i] =~ /\A(\s*(?:-\s+)?)title_en:\s/
      lines[i] = "#{$1}title_en: #{yaml_single_quote(title_en)}\n"
    end
  end
  lines.join
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
  return unless key && image_url

  filename  = "note-#{key}#{image_extension(image_url)}"
  file_path = File.join(NEWS_IMAGE_DIR, filename)

  return if File.exist?(file_path)

  FileUtils.mkdir_p(NEWS_IMAGE_DIR)
  image_data = agent.get_file(image_url)
  File.open(file_path, File::WRONLY | File::CREAT | File::EXCL, 0o644) do |file|
    file.binmode
    file.write(image_data)
  end
rescue Errno::EEXIST
  # already exists, skip
rescue => e
  warn "⚠️ Failed to save cover from #{image_url}: #{e.message}"
end

# How many articles you want to output? (Default: 3)
# Note: Rake passes an empty string ('') when no count is given, and '' is
# truthy in Ruby, so `ARGV[0] || '3'` would keep '' and `''.to_i` is 0.
def fetch_count(arg, default = 3)
  arg.to_s.empty? ? default : arg.to_i
end

if __FILE__ == $PROGRAM_NAME
  number_of_fetching_articles = fetch_count(ARGV[0])

  YASSLAB_NOTE_RSS = 'https://note.com/yasslab/rss'
  rss = RSS::Parser.parse(YASSLAB_NOTE_RSS, false)
  agent = Mechanize.new
  agent.user_agent_alias = 'Mac Safari'

  # Parse RSS and get yaml text
  existing_by_url = load_news_yaml.each_with_object({}) { |h, m| m[h['url']] = h }
  news = ''
  content = IO.read(NEWS_YAML)
  updated_count = 0

  rss.items.each.with_index(1) do |item, index|
    break if index > number_of_fetching_articles
    title = normalize_title(item.title)

    if (entry = existing_by_url[item.link])
      # 既存記事: note.com 側でタイトルが変わったときだけ更新する。
      next if entry['title'] == title

      title_en = normalize_title(note_title_en(agent, item.link))
      content  = update_entry_titles(content, url: item.link, title: title, title_en: title_en)
      updated_count += 1
      next
    end

    download_note_image(agent, item.link, note_image_url(agent, item.link))
    title_en = normalize_title(note_title_en(agent, item.link))

    news << "- title: #{yaml_single_quote(title)}\n"
    news << "  title_en: #{yaml_single_quote(title_en)}\n" if title_en
    news << "  date:  #{item.pubDate.strftime("%Y-%m-%d")}\n"
    news << "  url:   #{item.link}\n\n"
  end

  if news.empty? && updated_count.zero?
    puts "✅ No articles recently published or updated."
  else
    puts "🆕 Found new article(s)."         unless news.empty?
    puts "✏️ Updated #{updated_count} title(s)." if updated_count.positive?
    IO.write(NEWS_YAML, news + content)
  end
end
