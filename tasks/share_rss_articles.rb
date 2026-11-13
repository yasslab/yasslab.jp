#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rss'
require 'retryable'
require 'sanitize'
require 'slack/incoming/webhooks'
require 'active_support/all'
require 'mechanize'
require 'nokogiri'
require 'openai'

TIME_INTERVAL    = 60 # minutes
RSS_LIST         = [
# { title: "Name short title of the RSS", url: "URL of RSS to fetch and share with team" },
  { title: 'Hatena Bookmark', url: 'https://b.hatena.ne.jp/YassLab/rss'},
  { title: 'Qiita',           url: 'https://qiita.com/organizations/yasslab/activities.atom'},
  { title: 'TechRacho',       url: "https://techracho.bpsinc.jp/category/ruby-rails-related/feed"},
]

# NOTE: Ruby Weekly's pubDate is fixed at 00:00 UTC and the issue appears in the RSS later,
#       so the TIME_INTERVAL check never matches. Instead, remember the last posted issue
#       number (kept by actions/cache in GitHub Actions) and post issues newer than that.
RUBY_WEEKLY_RSS   = 'https://rubyweekly.com/rss/'
RUBY_WEEKLY_STATE = ENV.fetch('RUBY_WEEKLY_STATE', 'tmp/ruby_weekly_last_issue')

def ruby_weekly_issue_number(link)
  link.to_s[%r{/issues/(\d+)\z}, 1]&.to_i
end

# Returns issues newer than last_issue (oldest first).
# When nothing is remembered (first run or cache eviction), returns only the latest issue.
def new_ruby_weekly_items(items, last_issue)
  numbered = items.filter_map { |item|
    number = ruby_weekly_issue_number(item.link)
    [number, item] if number
  }.sort_by(&:first)
  return numbered.last(1).map(&:last) if last_issue.nil?
  numbered.select { |number, _| number > last_issue }.map(&:last)
end

# --- 3-line summary -----------------------------------------------------------
# #share のメンバーが、リンクを開く前に記事の要点をつかめるように、記事ごとに 3 行でまとめる。
# 要約できない時は RSS の description に戻して投稿は続ける。
# 相手のサイトの拒否など、こちらで直せない取得の失敗は警告だけにし、
# OpenAI 側の失敗（鍵・API・3 行でない）だけを投稿の後で exit 1 にして知らせる。
SUMMARY_MODEL      = 'gpt-4o-mini'
ARTICLE_TEXT_LIMIT = 6000 # characters sent to the model
SUMMARY_LINE_LIMIT = 80   # characters per line shown in Slack
SUMMARY_PROMPT     = <<~PROMPT.freeze
  あなたは技術記事を紹介する編集者です。渡された記事を、読む前に要点がつかめるよう日本語で 3 行にまとめてください。
  - ちょうど 3 行。1 行は 60 字以内
  - 記事に書かれていることだけを書く。推測や評価を足さない
  - 行頭に記号や番号を付けない。前置きや締めの文を書かない
PROMPT

class SummaryError < StandardError; end
class ArticleUnavailable < StandardError; end

def article_text(html)
  doc = Nokogiri::HTML(html)
  doc.css('script, style, noscript, nav, header, footer, aside, form').remove
  root = doc.at_css('article') || doc.at_css('main') || doc.at_css('body') || doc
  root.xpath('.//text()').map(&:text).join(' ').gsub(/[[:space:]]+/, ' ').strip[0, ARTICLE_TEXT_LIMIT]
end

def summarize_article(title, text, client:)
  response = client.chat(
    parameters: {
      model: SUMMARY_MODEL,
      temperature: 0,
      max_tokens: 400,
      messages: [
        { role: 'system', content: SUMMARY_PROMPT },
        { role: 'user',   content: "題名: #{title}\n\n#{text}" },
      ],
    }
  )
  lines = response.dig('choices', 0, 'message', 'content').to_s.lines
    .map { |line| line.sub(/\A\s*(?:[・\-*•]|\d+[.)．、])\s*/, '').strip }
    .reject(&:empty?)
  raise SummaryError, "expected 3 lines but got #{lines.size}: #{lines.inspect}" unless lines.size == 3
  lines
end

# 要約は記事の本文から作るので、本文にモデルを操る文が入っていても Slack の
# メンション（<!channel>）やリンクとして効かないよう、制御文字をエスケープして長さも切る
# https://docs.slack.dev/messaging/formatting-message-text#escaping
def slack_escape(text)
  text.gsub('&', '&amp;').gsub('<', '&lt;').gsub('>', '&gt;')
end

def summary_line(line)
  line = "#{line[0, SUMMARY_LINE_LIMIT]}…" if line.length > SUMMARY_LINE_LIMIT
  "> ・#{slack_escape(line)}"
end

def article_entry(head, summary, fallback)
  return [head, *summary.map { |line| summary_line(line) }].join("\n") if summary
  return "#{head}\n> #{fallback}" if fallback.present?
  head
end

# Each element is the list of article lines of one feed.
def slack_message(feeds)
  feeds.flatten.join("\n")
end

def last_ruby_weekly_issue(path)
  File.exist?(path) ? File.read(path).to_i : nil
end

def save_ruby_weekly_issue(path, number)
  FileUtils.mkdir_p(File.dirname(path))
  File.write(path, number.to_s)
end

SUMMARY_FAILURES = []

# 記事の本文を取る。相手のサイトの拒否（403 など）・通信の失敗・本文の無いページは
# こちらで直せないので ArticleUnavailable にまとめる
def fetch_article_text(url)
  agent = Mechanize.new { |a| a.open_timeout = 10; a.read_timeout = 20 }
  text  = article_text(agent.get(url).body)
  raise ArticleUnavailable, 'no article text' if text.empty?
  text
rescue ArticleUnavailable
  raise
rescue Mechanize::Error, Net::HTTPError, SocketError, SystemCallError, Timeout::Error, OpenSSL::SSL::SSLError => e
  raise ArticleUnavailable, "#{e.class}: #{e.message}"
end

def openai_client
  token = ENV['OPENAI_ACCESS_TOKEN'].to_s
  token.empty? ? nil : OpenAI::Client.new(access_token: token, request_timeout: 60)
end

# 記事を取って 3 行にまとめる。失敗したら nil を返す（呼び出し側は RSS の文に戻す）。
# 取得の失敗は警告だけ、OpenAI 側の失敗は failures に残して最後に赤にする
def summary_for(url, title, fetch: method(:fetch_article_text), client: openai_client, failures: SUMMARY_FAILURES)
  text = fetch.call(url)
  raise SummaryError, 'OPENAI_ACCESS_TOKEN is not set' if client.nil?

  summarize_article(title, text, client: client)
rescue ArticleUnavailable => e
  warn "::warning::Could not read #{url} for a summary: #{e.message}"
  nil
rescue => e
  failures << "Failed to summarize #{url}: #{e.class}: #{e.message}"
  nil
end

if __FILE__ == $PROGRAM_NAME
  slack = Slack::Incoming::Webhooks.new ENV['SLACK_SHARE']

  feeds    = []
  articles = []
  RSS_LIST.each { |rss|
    # Retry 3 times to HTTP connections at maximum
    Retryable.retryable(tries: 3, on: [Timeout::Error]) do
      # NOTE: Set TIME_INTERVAL value to cron scheduler in GitHub Actions to correspond this code.
      #       Passing 'false' to parse() means parsing the given RSS even if it is NOT valid RSS.
      if rss[:url].include? "qiita.com" # Atom feed that ends with '*.atom'
        articles = RSS::Parser.parse(rss[:url], false).items.select do |item|
          # NOTE: This feed doesn't contain timezone, so need to convert it into JST (+09:00)
          (Time.now.round - item.published.content + 9.hours) < TIME_INTERVAL * 60 # seconds
        end
      else # RSS feed that ends with '*.rss'
        articles = RSS::Parser.parse(rss[:url], false).items.select do |item|
          # Time comparision by seconds (integer)
          (Time.now.round - item.date).to_i < TIME_INTERVAL * 60 # seconds
        end
      end
    end

    feeds << articles.map {|a|
      if rss[:url].include? 'b.hatena.ne.jp'
        head, url, title, fallback = "<#{a.link}|#{a.title}> by `<https://b.hatena.ne.jp/YassLab|#{rss[:title]}>`", a.link, a.title, a.description
      elsif rss[:url].include? "qiita.com"
        head, url, title, fallback = "<#{a.link.href}|#{a.title.content}> by <https://qiita.com/#{a.author.name.content}|#{a.author.name.content}> `Qiita`", a.link.href, a.title.content, nil
      else # e.g. TechRacho articles
        head, url, title, fallback = "<#{a.link}|#{a.title}> by `<https://techracho.bpsinc.jp/category/ruby-rails-related|#{rss[:title]}>`", a.link, a.title, Sanitize.fragment(a.description)[0..110] + '...'
      end
      p article_entry(head, summary_for(url, title), fallback)
    }
  }

  # The description of Ruby Weekly is the whole newsletter HTML, so post the title and link with the summary only.
  weekly_items = Retryable.retryable(tries: 3, on: [Timeout::Error]) do
    new_ruby_weekly_items(RSS::Parser.parse(RUBY_WEEKLY_RSS, false).items, last_ruby_weekly_issue(RUBY_WEEKLY_STATE))
  end
  feeds << weekly_items.map { |a| p article_entry("<#{a.link}|#{a.title}> by `<https://rubyweekly.com/|Ruby Weekly>`", summary_for(a.link, a.title), nil) }
  msg = slack_message(feeds)

  if msg.empty?
    puts "✅ No recent updates ;)"
  else
    puts "🆕 Found new article(s)."
    slack.post msg
  end

  # Save after posting, so a failed post is retried in the next run.
  save_ruby_weekly_issue(RUBY_WEEKLY_STATE, ruby_weekly_issue_number(weekly_items.last.link)) if weekly_items.any?

  # 要約できなかった記事は元の文で投稿済み。理由が埋もれないよう、最後にこのステップを赤にして
  # workflow の失敗通知で知らせる（投稿と Ruby Weekly の号の保存は済ませてから落とす）
  unless SUMMARY_FAILURES.empty?
    SUMMARY_FAILURES.each { |failure| warn "::error::#{failure}" }
    exit 1
  end
end
