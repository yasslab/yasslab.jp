source 'http://rubygems.org'

# Replace 'git' with 'https' protocol
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.7.1'

gem "jekyll", "~> 4.0"
#gem "jekyll", github: "jekyll/jekyll"
gem "liquid-c"

gem 'redcarpet'
gem 'rack-jekyll', "~> 0.5"
gem 'rake'
gem 'nokogiri' # Used for qiita.rb

# Gems to enable SSL
gem 'acme_challenge'
gem 'rack-rewrite'
gem 'rack-contrib'

group :development do
  # Gems to fetch RSS in development only
  gem 'yaml'
  gem 'mechanize'
end

group :development, :test do
  gem 'rspec'
  gem 'html-proofer'

  # Gems for debugging
  gem 'pry'
  gem 'pry-byebug'
end

group :jekyll_plugins do
  gem "jekyll-include-cache"
end

group :production do
  gem 'puma'
end
