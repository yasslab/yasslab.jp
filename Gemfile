source 'https://rubygems.org'

# Replace 'git' with 'https' protocol
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'jekyll',  "4.3.3"
gem 'rack-jekyll'
gem 'rake'           # for running tasks

gem 'nokogiri'       # for qiita.rb
gem 'redcarpet'      # for rendering markdown files
gem 'html-proofer'   # Static check run all environment

# Gems to enable SSL
gem 'acme_challenge' # for authentication w/ LetsEncrypt
gem 'rack-rewrite'   # for redirection like http->https
gem 'rack-contrib'   # for managing CSP (cf. /config.ru)

# Workaround: Psych:Module unsafe_load error
# cf. https://google.com/search?q=method+%22unsafe_load%22+for+Psych
gem "psych", "< 4.0.0"

# To run tasks triggered by GitHub Actions
gem 'net-imap'          # Basics to access Web like notifications
gem 'net-smtp'          # Basics to access Web like notifications
gem 'net-pop'           # Basics to access Web like notifications
gem 'idobata'                 # All: Notify (To be removed)
gem 'slack-incoming-webhooks' # All: Notify

gem 'rss'               # RSS: Fetch RSS
gem 'sanitize'          # RSS: Remove HTML tags
gem 'activesupport'     # RSS: Time Calculation
gem 'yaml'              # note: Upsert articles
gem 'mechanize'         # note: Upsert articles
gem 'google-api-client' # GCal: Access to Calendar
gem 'multi_json'        # GCal: Access to Calendar
gem 'gmail'             # Share inquiry from form
gem 'retryable'         # Retry on errors like HTTP

group :jekyll_plugins do
  gem 'jekyll-feed'
  gem 'jekyll-include-cache'
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
