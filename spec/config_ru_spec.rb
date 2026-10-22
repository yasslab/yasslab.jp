require 'spec_helper'
require 'rack'

# 本番の配信 (config.ru) が、ビルドした _site をどう返すかを確かめる。
# CI は Puma を起動しないので、ここで config.ru を組み立てて呼び出す
RSpec.describe 'config.ru' do
  def build_app(rack_env)
    original = ENV['RACK_ENV']
    ENV['RACK_ENV'] = rack_env
    app = Rack::Builder.parse_file(File.expand_path('../config.ru', __dir__))
    app.is_a?(Array) ? app.first : app # Rack 2 までは [app, options] を返す
  ensure
    ENV['RACK_ENV'] = original
  end

  def get(url, app: @app)
    status, headers, body = app.call(Rack::MockRequest.env_for(url))
    text = +''
    body.each { |chunk| text << chunk }
    body.close if body.respond_to?(:close)
    headers = headers.to_h.transform_keys(&:downcase)
    [status, headers, text.force_encoding('UTF-8')]
  end

  before(:all) do
    system('bundle exec jekyll build') unless File.exist?('_site/404.html')
    @app = build_app('development')
  end

  {
    '/'                     => ['text/html; charset=utf-8', '<html lang="ja">'],
    '/ja/'                  => ['text/html; charset=utf-8', '<title>YassLab 株式会社'],
    '/ja'                   => ['text/html; charset=utf-8', '<title>YassLab 株式会社'],
    '/en/'                  => ['text/html; charset=utf-8', '<title>YassLab Inc.'],
    '/ja/news'              => ['text/html; charset=utf-8', '<html lang="ja">'],
    '/health'               => ['text/html; charset=utf-8', 'ok'],
    '/members.json'         => ['application/json',         '"username_github"'],
    '/twilio/reception.xml' => ['application/xml',          '<Response>'],
  }.each do |path, (content_type, marker)|
    it "serves #{path} with security headers" do
      status, headers, body = get("https://yasslab.jp#{path}")
      expect(status).to eq(200)
      expect(headers['content-type']).to eq(content_type)
      expect(body).to include(marker)
      expect(headers['content-security-policy']).to start_with("default-src 'self'")
      expect(headers['strict-transport-security']).to eq('max-age=31536000; preload')
      expect(headers['x-frame-options']).to eq('DENY')
    end
  end

  it 'serves 404.html with 404 for a missing page' do
    status, headers, body = get('https://yasslab.jp/no-such-page')
    expect(status).to eq(404)
    expect(headers['content-type']).to start_with('text/html')
    expect(body).to eq(File.read('_site/404.html'))
  end

  it 'redirects old news URLs' do
    status, headers, = get('https://yasslab.jp/ja/posts/foo')
    expect(status).to eq(301)
    expect(headers['location']).to eq('/ja/news/foo')
  end

  context 'in production' do
    before(:all) { @production = build_app('production') }

    it 'redirects http to https' do
      status, headers, = get('http://yasslab.jp/ja/', app: @production)
      expect(status).to eq(301)
      expect(headers['location']).to eq('https://yasslab.jp/ja/')
    end

    it 'redirects another host to yasslab.jp' do
      status, headers, = get('https://www.yasslab.jp/ja/', app: @production)
      expect(status).to eq(301)
      expect(headers['location']).to eq('https://yasslab.jp/ja/')
    end

    it 'serves a review app without redirecting' do
      status, = get('https://yasslab-jp-pr-1.herokuapp.com/ja/', app: @production)
      expect(status).to eq(200)
    end
  end
end
