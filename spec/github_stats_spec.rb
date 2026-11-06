require 'jekyll'
require_relative '../_plugins/github'

# GitHub API は 1 ページに 100 件までしか返さないので、101 件目以降も数えるにはページを送る
describe 'Jekyll::GitHubStats.fetch_repos' do
  def repos(count)
    Array.new(count) { { 'stargazers_count' => 1 } }
  end

  it 'follows pages until a page has fewer than 100 repos' do
    pages = { 1 => repos(100), 2 => repos(1) }
    requested = []
    result = Jekyll::GitHubStats.fetch_repos do |uri|
      page = uri.query[/page=(\d+)\z/, 1].to_i
      requested << page
      JSON.generate(pages.fetch(page))
    end

    expect(result.size).to eq 101
    expect(requested).to eq [1, 2]
  end

  it 'requests only one page when there are fewer than 100 repos' do
    requested = []
    result = Jekyll::GitHubStats.fetch_repos { |uri| requested << uri; JSON.generate(repos(72)) }

    expect(result.size).to eq 72
    expect(requested.size).to eq 1
  end

  # API の上限などで失敗した時は、エラーの Hash をそのまま返す（呼び出し側が既定値に切り替える）
  it 'returns the error hash when the API fails' do
    error = { 'message' => 'API rate limit exceeded' }
    pages = { 1 => repos(100), 2 => error }
    result = Jekyll::GitHubStats.fetch_repos do |uri|
      JSON.generate(pages.fetch(uri.query[/page=(\d+)\z/, 1].to_i))
    end

    expect(result).to eq error
  end
end
