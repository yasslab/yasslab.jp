require 'spec_helper'

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
end
