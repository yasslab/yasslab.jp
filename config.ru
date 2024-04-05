require 'acme_challenge'
use AcmeChallenge, ENV['ACME_CHALLENGE'] if ENV['ACME_CHALLENGE']

# Check your routing by running
# $ rackup config.ru
require 'rack/rewrite'
use Rack::Rewrite do
  r301 %r{/ja/posts(.*)}, '/ja/news$1'

  if ENV['RACK_ENV'] == 'production'
    r301 %r{.*}, 'https://yasslab.jp$&', scheme: 'http'
    r301 %r{.*}, 'https://yasslab.jp$&', if: Proc.new {|rack_env|
      rack_env['SERVER_NAME'] != 'yasslab.jp' &&
      rack_env['SERVER_NAME'] !~ /yasslab-jp-pr-(\d+)\.herokuapp\.com/
    }
  end
end

require 'rack/contrib/try_static'
use Rack::TryStatic,
  urls: %w[/],
  root: '_site',
  try: ['.html', 'index.html', '/index.html', 'humans.txt'],
  header_rules: [
    [:all, {
      'Strict-Transport-Security' => 'max-age=31536000; preload',
      'X-Xss-Protection'          => '1; mode=block',
      'X-Content-Type-Options'    => 'nosniff',
      'X-Frame-Options'           => 'DENY',
      'Content-Security-Policy'   => "default-src 'self' 'unsafe-inline' 'unsafe-eval' cdn.jsdelivr.net *.google.com *.google-analytics.com  *.googleusercontent.com *.facebook.net *.facebook.com *.twitter.com *.github.com *.cloudfront.net buttons.github.io *.hatena.ne.jp *.st-hatena.com *.wufoo.com *.mailchimp.com *.twimg.com *.fontawesome.com speakerdeck.com speakerd.herokuapp.com coderdojo.jp code.jquery.com fonts.googleapis.com fonts.gstatic.com cdnjs.cloudflare.com stackpath.bootstrapcdn.com public.slidesharecdn.com www.slideshare.net www.youtube.com www.w3.org d.line-scdn.net banners.itunes.apple.com; img-src * 'self' data: https:;"
    }],
    [['html'],    { 'Content-Type'  => 'text/html; charset=utf-8'}],
    [['txt'],     { 'Content-Type'  => 'text/plain; charset=utf-8'}],
    [['css'],     { 'Content-Type'  => 'text/css'}],
    [['js'],      { 'Content-Type'  => 'text/javascript' }],
    [['png'],     { 'Content-Type'  => 'image/png' }],
    [['gif'],     { 'Content-Type'  => 'image/gif' }],
    [['jpeg'],    { 'Content-Type'  => 'image/jpeg' }],
    [['jpg'],     { 'Content-Type'  => 'image/jpeg' }],
    [['zip'],     { 'Content-Type'  => 'application/zip' }],
    [['pdf'],     { 'Content-Type'  => 'application/pdf' }],
    [['/assets'], { 'Cache-Control' => 'public', 'Vary' => 'Accept-Encoding' }]
  ]

  run lambda { |env|
    [404, { 'Content-Type' => 'text/html' }, File.open('_site/404.html', File::RDONLY)]
  }

require "rack/jekyll"
run Rack::Jekyll.new
