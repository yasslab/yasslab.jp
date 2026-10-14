require 'net/http'
require 'json'

# heroku-deploy の success は、git push が通ったことしか意味しない。
# Heroku 側でビルドが飛ばされても緑になる (coderdojo-japan/coderdojo.jp#1848) ので、
# そのコミットのリリースが succeeded になったかを Platform API で確かめる。
#
# 使い方: ruby tasks/verify_heroku_release.rb <コミットの SHA>
# 環境変数: HEROKU_API_KEY, HEROKU_APP_NAME
#
# ci.yml の deploy ジョブは setup-ruby を通さずランナーの Ruby で動かすので、標準ライブラリだけで書く
module HerokuRelease
  # git push でのリリースは description が "Deploy <SHA の先頭 8 文字>" になる
  def self.deployed?(releases, sha)
    releases.any? do |release|
      deployed_sha = release['description'].to_s[/\ADeploy (\h+)\z/, 1]
      deployed_sha && sha.start_with?(deployed_sha) && release['status'] == 'succeeded'
    end
  end

  def self.recent(app_name, api_key, max: 5)
    uri = URI("https://api.heroku.com/apps/#{app_name}/releases")
    request = Net::HTTP::Get.new(uri)
    request['Accept']        = 'application/vnd.heroku+json; version=3'
    request['Authorization'] = "Bearer #{api_key}"
    request['Range']         = "version ..; order=desc, max=#{max}"
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) { |http| http.request(request) }
    raise "Heroku API returned #{response.code}" unless response.is_a?(Net::HTTPSuccess)
    JSON.parse(response.body)
  end
end

if __FILE__ == $0
  sha      = ARGV.fetch(0)
  releases = HerokuRelease.recent(ENV.fetch('HEROKU_APP_NAME'), ENV.fetch('HEROKU_API_KEY'))
  releases.each { |release| puts "v#{release['version']}\t#{release['status']}\t#{release['description']}" }

  unless HerokuRelease.deployed?(releases, sha)
    puts "::error::#{sha[0, 8]} のリリースが succeeded ではありません。Heroku のリリース一覧を確認してください"
    exit 1
  end
  puts "#{sha[0, 8]} のリリースが本番に届きました"
end
