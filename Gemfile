source 'http://rubygems.org'

# Replace 'git' with 'https' protocol
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.7.2'

gem "jekyll", "~> 4.2"
#gem "jekyll", github: "jekyll/jekyll"

#gem 'rack-jekyll', "~> 0.5"
gem 'rack-jekyll', github: "adaoraul/rack-jekyll"
gem 'rake'           # for running scripts
gem 'nokogiri'       # for qiita.rb
gem 'redcarpet'      # for rendering markdown files
gem 'html-proofer'   # Static check run all environment

# Gems to enable SSL
gem 'acme_challenge' # for authentication w/ LetsEncrypt
gem 'rack-rewrite'   # for redirection like http->https
gem 'rack-contrib'   # for managing CSP (cf. /config.ru)

# To enhance building time with Jekyll 4.0.0+
# https://github.com/yasslab/yasslab.jp/pull/123
gem "liquid-c"

# To run tasks triggered by GitHub Actions
group :actions, optional: true do
  gem 'idobata'           # All: Notify
  gem 'sanitize'          # RSS: Remove HTML tags
  gem 'activesupport'     # RSS: Time Calculation
  gem 'yaml'              # note: Upsert articles
  gem 'mechanize'         # note: Upsert articles
  gem 'google-api-client' # GCal: Access to Calendar
  gem 'multi_json'        # GCal: Access to Calendar
  gem 'gmail'             # Share inquiry from form
end

group :jekyll_plugins do
  gem 'jekyll-feed'
  gem "jekyll-include-cache"
  gem 'jekyll-sitemap'
  gem 'jekyll-minifier'
end

group :development, :test do
  gem 'rspec'

  # Gems for debugging
  gem 'pry'
  gem 'pry-byebug'
end

group :production do
  # Heroku + Puma  https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server
  gem 'puma'

  # Heroku Metrics https://devcenter.heroku.com/articles/language-runtime-metrics-ruby
  gem 'barnes'
end
