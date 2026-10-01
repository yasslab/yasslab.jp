require 'spec_helper'
require 'liquid'

# ページ冒頭の背景画像 (_includes/thumbnail.html) と、その preload (_includes/header.html)。
# どちらも _includes/thumbnail-url.html で URL を求める。背景画像はインラインの CSS で
# 指定するので、HTML-Proofer は参照先の実在を確かめない。
RSpec.describe 'Page header background' do
  before(:all) do
    system('bundle exec jekyll build') unless File.exist?('_site/ja/brand.html')
  end

  BACKGROUND = /padding: 100px 0; margin-bottom: 0; border-radius: 0px;\s*background: url\(([^)]*)\)/
  PRELOAD    = /<link rel="preload" as="image" href="([^"]*)" fetchpriority="high">/
  # 英語トップの preload (.catchCopy の背景画像) は thumbnail.html とは別
  CATCH_COPY = '/img/bg-coding.webp'

  def background(path) = File.read(path)[BACKGROUND, 1]
  def preloads(path)   = File.read(path).scan(PRELOAD).flatten - [CATCH_COPY]

  # 今のサイトでは背景画像がすべて bg-sky.jpg になり、ビルドした成果物からは
  # /img/<thumbnail> と外部 URL の分岐を確かめられない。テンプレートを直接描画する
  describe 'thumbnail-url.html' do
    def thumbnail_url(page)
      Liquid::Template.parse(File.read('_includes/thumbnail-url.html')).render('page' => page)
    end

    it 'uses bg-sky.jpg under /ja/news even when the page has its own thumbnail' do
      expect(thumbnail_url('url' => '/ja/news/x', 'thumbnail' => 'photos/x.png')).to eq('/img/bg-sky.jpg')
    end

    it 'uses an external thumbnail as-is' do
      expect(thumbnail_url('url' => '/ja/x', 'thumbnail' => 'https://example.com/x.png')).to eq('https://example.com/x.png')
    end

    it 'uses the thumbnail under /img/ otherwise' do
      expect(thumbnail_url('url' => '/ja/x', 'thumbnail' => 'photos/x.png')).to eq('/img/photos/x.png')
    end

    it 'falls back to bg-sky.jpg when the page has no thumbnail' do
      expect(thumbnail_url('url' => '/ja/x')).to eq('/img/bg-sky.jpg')
    end
  end

  describe 'URL in the built site' do
    it 'uses bg-sky.jpg under /ja/news even when the post has its own thumbnail' do
      expect(background('_site/ja/news/railstutorial-seminar-2019-autumn.html')).to eq('/img/bg-sky.jpg')
    end

    it 'falls back to bg-sky.jpg when the page has no thumbnail' do
      expect(background('_site/ja/brand.html')).to eq('/img/bg-sky.jpg')
    end
  end

  describe 'every page' do
    let(:pages) { Dir['_site/**/*.html'] }

    it 'points the background to an existing file' do
      missing = pages.filter_map do |path|
        url = background(path)
        next if url.nil? || url.start_with?('http')

        "#{path}: #{url}" unless File.exist?(File.join('_site', url))
      end
      expect(missing).to be_empty, "Missing background images:\n#{missing.join("\n")}"
    end

    it 'preloads exactly the background it shows, and nothing on pages without one' do
      mismatched = pages.filter_map do |path|
        url      = background(path)
        expected = url ? [url] : []
        "#{path}: background=#{url.inspect} preload=#{preloads(path).inspect}" if preloads(path) != expected
      end
      expect(mismatched).to be_empty, "Preload does not match the background:\n#{mismatched.join("\n")}"
    end
  end
end
