require 'spec_helper'
require 'nokogiri'
require 'jekyll'

SAMPLE_QIITA_PATH = '_data/qiita_org_sample.html'.freeze

RSpec.describe 'Qiita' do
  require './_plugins/qiita.rb'
  it 'plugin should get Item & Like numbers' do
    mock = File.expand_path(SAMPLE_QIITA_PATH)

    items = Liquid::Template.parse("{% qiita_stats items %}")
    expect(Integer items.render).to be_truthy
    likes = Liquid::Template.parse("{% qiita_stats likes %}")
    expect(Integer likes.render).to be_truthy
  end
end
