require 'acme_challenge'
use AcmeChallenge, ENV['ACME_CHALLENGE'] if ENV['ACME_CHALLENGE']

require 'rack/jekyll'
run Rack::Jekyll.new
