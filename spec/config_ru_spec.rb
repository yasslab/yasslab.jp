require 'spec_helper'
require 'rack'
require 'rack/mock'

# config.ru が返す応答を固定する（rack の版を上げても変わらないことを確かめる）
RSpec.describe 'config.ru' do
  before(:all) do
    system('bundle exec jekyll build') unless File.exist?('_site/404.html')
  end

  def app(rack_env: 'test')
    original = ENV['RACK_ENV']
    ENV['RACK_ENV'] = rack_env
    built = Rack::Builder.parse_file('config.ru')
    built.is_a?(Array) ? built.first : built # rack 1 は [app, options] を返す
  ensure
    ENV['RACK_ENV'] = original
  end

  def get(path, rack_env: 'test')
    Rack::MockRequest.new(app(rack_env: rack_env)).get(path)
  end

  it 'returns the built page with security headers' do
    response = get('/ja/')
    expect(response.status).to eq 200
    expect(response.body.b).to eq File.binread('_site/ja/index.html')
    expect(response.headers['X-Frame-Options']).to eq 'DENY'
    expect(response.headers['Content-Type']).to eq 'text/html; charset=utf-8'
  end

  it 'returns the health page' do
    expect(get('/health').status).to eq 200
  end

  it 'returns 404.html for unknown paths' do
    response = get('/no-such-page')
    expect(response.status).to eq 404
    expect(response.body.b).to eq File.binread('_site/404.html')
  end

  it 'redirects old post URLs to news' do
    response = get('/ja/posts/2020-01-01-foo')
    expect(response.status).to eq 301
    expect(response.headers['Location']).to eq '/ja/news/2020-01-01-foo'
  end

  it 'redirects http to https in production' do
    response = get('http://yasslab.jp/ja/', rack_env: 'production')
    expect(response.status).to eq 301
    expect(response.headers['Location']).to eq 'https://yasslab.jp/ja/'
  end
end
