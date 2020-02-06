source 'http://rubygems.org'

# Replace 'git' with 'https' protocol
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.5'

gem "jekyll", "~> 4.0"
#gem "jekyll", github: "jekyll/jekyll"
gem "liquid-c"

gem 'redcarpet'
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
  gem "jekyll-include-cache"
  gem 'qiita'
  gem 'github'
end

group :production do
  gem 'puma'
end
