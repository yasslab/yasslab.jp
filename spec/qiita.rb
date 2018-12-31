require 'spec_helper'
require 'nokogiri'
require 'mechanize'
require 'jekyll'

SUCESS_MOCK_PATH = 'spec/mock.html'.freeze
FAILED_MOCK_PATH = 'spec/error_mock.html'.freeze

RSpec.describe 'Qiita' do
  require './_plugins/qiita.rb'
  it 'qiita-like-and-items' do
    mock = File.expand_path(SUCESS_MOCK_PATH)
    allow_any_instance_of(Mechanize).to receive(:get).and_return(Mechanize.new.get("file://#{mock}"))

    items = Liquid::Template.parse("{% qiita_items %}")
    expect(items.render).to be == '190'
    likes = Liquid::Template.parse("{% qiita_likes %}")
    expect(likes.render).to be == '6900'
  end

  it 'not possible to obtain' do
    mock = File.expand_path(FAILED_MOCK_PATH)
    allow_any_instance_of(Mechanize).to receive(:get).and_return(Mechanize.new.get("file://#{mock}"))

    items = Liquid::Template.parse("{% qiita_items %}")
    expect(items.render).to be == Jekyll::QIITA_PRESET_ITEMS.to_s
    likes = Liquid::Template.parse("{% qiita_likes %}")
    expect(likes.render).to be == Jekyll::QIITA_PRESET_LIKES.to_s

  end
end
