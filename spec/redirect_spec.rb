require 'spec_helper'
require 'yaml'

RSpec.describe 'Redirect pages with anchor preservation' do
  before(:all) do
    # Build Jekyll site if not already built
    system('bundle exec jekyll build') unless File.exist?('_site/members.html')
  end

  describe '/members.html' do
    before(:all) do
      @members_html = File.read('_site/members.html')
    end

    it 'has redirect layout with JavaScript' do
      expect(@members_html).to include('location.replace')
    end

    it 'preserves hash/anchor in redirect' do
      # アンカー保持のコード: location.hash を直接使用
      expect(@members_html).to include('location.hash')

      # リダイレクト先にアンカーを追加: "{{ page.redirect_to }}" + location.hash
      expect(@members_html).to match(/location\.replace\([^)]+\s*\+\s*location\.hash\)/)
    end

    it 'redirects to /ja/#members' do
      # Front Matter または JavaScript のいずれかに /ja/#members が含まれる
      has_redirect = @members_html.include?('redirect_to: /ja/#members') ||
                     @members_html.include?('location.replace("/ja/#members"')
      expect(has_redirect).to be true
    end

    it 'handles case when redirect_to is specified' do
      # redirect_to が指定されている場合の処理（Jekyllが実際の値に展開する）
      # 例: if ("/ja/#members" != ""){
      expect(@members_html).to match(/if\s*\("\/[a-z]+\/.*"\s*!=\s*""\)/)
    end

    it 'handles language detection for fallback' do
      # redirect_to が空の場合の言語判定フォールバック
      expect(@members_html).to include('getBrowserLanguage')
      expect(@members_html).to match(/location\.replace\("\/ja\/"\s*\+\s*location\.hash\)/)
      expect(@members_html).to match(/location\.replace\("\/en\/"\s*\+\s*location\.hash\)/)
    end
  end

  describe 'Comment describes the feature correctly' do
    before(:all) do
      @redirect_layout = File.read('_layouts/redirect.html')
    end

    it 'has explanatory comment about anchor preservation' do
      expect(@redirect_layout).to include('アンカーを保持')
    end
  end

  describe 'All redirect pages' do
    # ソースの front matter から { URL => front matter } を作る (例: ja/coc.md → /ja/coc)
    # CI は gem を vendor/bundle に入れるので、git で管理しているファイルだけを読む
    def redirect_pages
      @redirect_pages ||= `git ls-files '*.md' '*.html'`.split("\n").filter_map {
        front_matter = File.read(it)[/\A---\n(.*?)\n---/m, 1] or next
        data = YAML.safe_load(front_matter)
        ['/' + it.sub(/(index)?\.(md|html)\z/, ''), data] if data['layout'] == 'redirect'
      }.to_h
    end

    it 'sets lang: en on redirect pages under /en/' do
      redirect_pages.select { |url, _| url.start_with?('/en/') }.each do |url, data|
        expect(data['lang']).to eq('en'), "#{url} has no lang: en"
      end
    end

    it 'redirects straight to the final page, not to another redirect page' do
      redirect_pages.each do |url, data|
        target = data['redirect_to'].to_s.sub(/#.*/, '')
        expect(redirect_pages).not_to have_key(target), "#{url} → #{target} is another redirect page"
      end
    end

    # HTML-Proofer は JS 内の URL を見ないので、行き先のページが消えても気づけない
    it 'redirects to a page that exists' do
      redirect_pages.each do |url, data|
        target = data['redirect_to'].to_s.sub(/#.*/, '')
        next unless target.start_with?('/')
        files = ["_site#{target}.html", "_site#{target}/index.html"]
        expect(files.any? { File.exist?(it) }).to be(true), "#{url} → #{target} does not exist"
      end
    end

    # / はブラウザの言語で振り分ける入口なので、リンクしてよい
    it 'is not linked from other pages except /' do
      linked = Dir.glob('_site/**/*.html').flat_map { |path|
        File.read(path).scan(/href="([^"#]+)/).flatten.map { [path, it] }
      }.select { |_, href| href != '/' && redirect_pages.key?(href) }
      expect(linked).to be_empty
    end
  end
end
