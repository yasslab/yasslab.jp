require 'spec_helper'

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

  describe 'URL' do
    it 'uses bg-sky.jpg under /ja/news even when the post has its own thumbnail' do
      expect(background('_site/ja/news/railstutorial-seminar-2019-autumn.html')).to eq('/img/bg-sky.jpg')
    end

    it 'uses the thumbnail under /img/ outside /ja/news' do
      expect(background('_site/en/news/index.html')).to eq('/img/bg-sky.jpg')
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
