require 'spec_helper'

# ヘッダーのロゴ (_includes/header.html) は、英語のページでは英語のトップへ戻す
RSpec.describe 'Header logo link' do
  before(:all) do
    system('bundle exec jekyll build') unless File.exist?('_site/en/agile.html')
  end

  LOGO_LINK = %r{<a href="([^"]*)">\s*<img src="/img/icons/yasslab-white.svg"}

  def logo_href(path) = File.read(path)[LOGO_LINK, 1]

  it 'links to the English top page from /en/' do
    expect(logo_href('_site/en/index.html')).to eq('/en/')
  end

  it 'links to the English top page from pages under /en/' do
    expect(logo_href('_site/en/agile.html')).to eq('/en/')
  end

  it 'links to the Japanese top page from Japanese pages' do
    expect(logo_href('_site/ja/about.html')).to eq('/ja/')
  end
end
