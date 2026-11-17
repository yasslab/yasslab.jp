require 'spec_helper'

# 検索エンジンに読んでほしい本文の無いファイルがサイトマップに載ると、
# Search Console がソフト 404 として報告する。
RSpec.describe 'sitemap.xml' do
  before(:all) do
    system('bundle exec jekyll build') unless File.exist?('_site/sitemap.xml')
    @locs = File.read('_site/sitemap.xml').scan(%r{<loc>(.*?)</loc>}).flatten
  end

  it 'has the top pages' do
    expect(@locs).to include('https://yasslab.jp/ja/', 'https://yasslab.jp/en/')
  end

  it 'excludes the Google site verification files' do
    expect(@locs.grep(%r{/google\h+\.html\z})).to be_empty
  end

  it 'excludes the health check file' do
    expect(@locs).not_to include('https://yasslab.jp/health.html')
  end

  it 'excludes the 404 page' do
    expect(@locs.grep(%r{/404(\.html)?\z})).to be_empty
  end
end
