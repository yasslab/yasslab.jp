source 'http://rubygems.org'
ruby '2.6.3'

gem 'redcarpet'
gem 'jekyll'
gem 'rack-jekyll'
gem 'rake'
gem 'rspec'
gem 'mechanize'
gem 'html-proofer'

# Gems to enable SSL
gem 'acme_challenge'
gem 'rack-rewrite'
gem 'rack-contrib'


group :development, :test do
  gem 'pry-byebug'
end

group :jekyll_plugins do
  gem "jekyll-gist"
  gem "jekyll-coffeescript"
  gem "jekyll-assets"
  gem 'jekyll-feed'
  gem 'qiita'
end

group :production do
  gem 'puma'
end
