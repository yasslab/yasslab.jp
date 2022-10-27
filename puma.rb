require 'yaml'

# web: bundle exec puma -t 8:32 -w 3 -p $PORT
# Example settings: https://github.com/puma/puma-heroku/blob/master/lib/puma/plugin/heroku.rb
workers_count = Integer(ENV['WEB_CONCURRENCY'] || 1)
threads_count = Integer(ENV['MAX_THREADS']     || 5)
threads threads_count, threads_count

if workers_count > 1
  preload_app!
  workers workers_count
end

port        ENV['PORT']     || 4000
environment ENV['RACK_ENV'] || 'development'

# Heroku Metrics
# https://devcenter.heroku.com/articles/language-runtime-metrics-ruby
require 'barnes'
before_fork do
  # worker specific setup

  Barnes.start # Must have enabled worker mode for this to block to be called
end
