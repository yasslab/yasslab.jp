require 'net/http'
require 'openssl'

# 本番のサイトが応答しているかを、外から確かめる (死活監視)。
# 一時的な揺れで通知しないよう、失敗したら間を空けて試し直してから問題とする。
#
# 使い方: ruby tasks/check_uptime.rb
#
# uptime.yml は setup-ruby を通さずランナーの Ruby で動かすので、標準ライブラリだけで書く
module Uptime
  SITE = 'https://yasslab.jp'

  # 本文の目印は、ニュースのように毎時変わる部分ではなく、変わらない部分にする
  CHECKS = [
    { url: "#{SITE}/health",                body: 'ok' },
    { url: "#{SITE}/ja/",                   body: '<title>YassLab 株式会社' },
    { url: "#{SITE}/en/",                   body: '<title>YassLab Inc.' },
    { url: "#{SITE}/twilio/reception.xml",  body: '<Response>' }, # 電話の自動応答が読む
    { url: "#{SITE}/members.json",          body: '"yasulab"' },  # 他のリポジトリのレビューが読む
    { url: 'http://yasslab.jp/', status: 301, location: "#{SITE}/" }
  ]

  def self.fetch(url)
    uri = URI(url)
    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', open_timeout: 10, read_timeout: 20) do |http|
      http.request(Net::HTTP::Get.new(uri))
    end
  end

  def self.problem(url, status: 200, body: nil, location: nil, attempts: 3, wait: 10)
    message = nil
    attempts.times do |i|
      sleep wait if i > 0
      message = begin
        response = fetch(url)
        if response.code.to_i != status
          "#{url} が #{response.code} を返しました (期待: #{status})"
        elsif body && !response.body.to_s.dup.force_encoding('UTF-8').include?(body)
          "#{url} の本文に #{body} がありません"
        elsif location && response['Location'] != location
          "#{url} の転送先が #{response['Location']} です (期待: #{location})"
        end
      rescue StandardError => e
        "#{url} に接続できません (#{e.class}: #{e.message})"
      end
      return nil unless message
    end
    message
  end

  def self.certificate_expires_at(host)
    Net::HTTP.start(host, 443, use_ssl: true, open_timeout: 10) { |http| http.peer_cert.not_after }
  end

  def self.certificate_problem(host, expires_at, days: 14)
    left = ((expires_at - Time.now) / 86400).floor
    "#{host} の証明書の期限まで残り #{left} 日です (#{expires_at.utc} UTC)" if left < days
  end
end

if __FILE__ == $0
  problems = Uptime::CHECKS.map { |check| Uptime.problem(check[:url], **check.except(:url)) }
  host = URI(Uptime::SITE).host
  problems << begin
    Uptime.certificate_problem(host, Uptime.certificate_expires_at(host))
  rescue StandardError => e
    "#{host} の証明書を読めません (#{e.class}: #{e.message})"
  end
  problems.compact!

  problems.each { |problem| puts "::error::#{problem}" }
  exit 1 unless problems.empty?
  puts "#{Uptime::CHECKS.size} 件の URL と証明書に問題はありません"
end
