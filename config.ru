require 'acme_challenge'
use AcmeChallenge, ENV['ACME_CHALLENGE'] if ENV['ACME_CHALLENGE']

require 'rack/rewrite'
use Rack::Rewrite do
  if ENV['RACK_ENV'] == 'production'
    r301 %r{.*}, 'https://railsguides.jp$&', :scheme => 'http'
  end
end

require 'rack/jekyll'
run Rack::Jekyll.new
