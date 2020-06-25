require 'spec_helper'
require 'nokogiri'
require 'jekyll'

SUCESS_MOCK_PATH = 'spec/mock.html'.freeze
FAILED_MOCK_PATH = 'spec/error_mock.html'.freeze

RSpec.describe 'Qiita' do
  require './_plugins/qiita.rb'
  it 'qiita-like-and-items' do
    mock = File.expand_path(SUCESS_MOCK_PATH)

    items = Liquid::Template.parse("{% qiita_stats items %}")
    expect(items.render).to be == '80'
    likes = Liquid::Template.parse("{% qiita_stats likes %}")
    expect(likes.render).to be == '6710'
  end

  it 'not possible to obtain' do
    mock = File.expand_path(FAILED_MOCK_PATH)

    items = Liquid::Template.parse("{% qiita_stats items %}")
    expect(items.render).to be == Jekyll::QIITA_PRESET_ITEMS.to_s
    likes = Liquid::Template.parse("{% qiita_stats likes %}")
    expect(likes.render).to be == Jekyll::QIITA_PRESET_LIKES.to_s
  end
end
