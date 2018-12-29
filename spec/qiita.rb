require 'spec_helper'
require 'nokogiri'
require 'mechanize'
require 'jekyll'

RSpec.describe 'Qiita' do
  require './_plugins/qiita.rb'
  it 'qiita-like-and-items' do
    mock = 'spec/mock.html'
    mock_path = File.expand_path(mock)
    allow_any_instance_of(Mechanize).to receive(:get).and_return(Mechanize.new.get("file://#{mock_path}"))

    items = Liquid::Template.parse("{% qiita_items %}")
    expect(items.render).to be == '192'
    likes = Liquid::Template.parse("{% qiita_likes %}")
    expect(likes.render).to be == '6938'
  end

  it 'not possible to obtain' do
    mock = 'spec/error_mock.html'
    mock_path = File.expand_path(mock)
    allow_any_instance_of(Mechanize).to receive(:get).and_return(Mechanize.new.get("file://#{mock_path}"))

    items = Liquid::Template.parse("{% qiita_items %}")
    expect(items.render).to be == '0'
    likes = Liquid::Template.parse("{% qiita_likes %}")
    expect(likes.render).to be == '0'

  end
end
