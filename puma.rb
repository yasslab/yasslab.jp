require 'yaml'

# web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
# Doc: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server
# Example: https://github.com/puma/puma-heroku/blob/master/lib/puma/plugin/heroku.rb
workers_count = Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS']     || 5)

workers workers_count
threads threads_count, threads_count
preload_app!

# NOTE: DefaultRackup is removed from Puma 6
# https://github.com/puma/puma/blob/master/6.0-Upgrade.md
rackup      DefaultRackup if defined?(DefaultRackup)
port        ENV['PORT']     || 4000
environment ENV['RACK_ENV'] || 'development'

# Heroku Metrics
# https://devcenter.heroku.com/articles/language-runtime-metrics-ruby
require 'barnes'
before_fork do
  # worker specific setup

  Barnes.start # Must have enabled worker mode for this to block to be called
end
