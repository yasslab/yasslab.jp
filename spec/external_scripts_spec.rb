require 'spec_helper'

# 全ページで読む外部の script は、版を固定して integrity を付ける。
# @latest のままだと、CDN に新しい版が出た時に、確かめないまま全ページに入る
RSpec.describe 'External scripts in _includes/header.html' do
  scripts = File.read(File.expand_path('../_includes/header.html', __dir__))
                .scan(%r{<script\b[^>]*\bsrc="https://cdn\.jsdelivr\.net/[^"]*"[^>]*>})

  it 'loads at least one script from jsDelivr' do
    expect(scripts).not_to be_empty
  end

  scripts.each do |tag|
    src = tag[/src="([^"]+)"/, 1]

    it "pins the version of #{src}" do
      expect(src).to match(%r{@\d+\.\d+\.\d+/})
    end

    it "checks the integrity of #{src}" do
      expect(tag).to match(/\bintegrity="sha(256|384|512)-[^"]+"/)
    end
  end
end
