# web: bundle exec puma -t 8:32 -w 3 -p $PORT
workers Integer(ENV['WEB_CONCURRENCY'] || 3)
threads 8, 32

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 4000
environment ENV['RACK_ENV'] || 'development'

# Heroku Metrics
# https://devcenter.heroku.com/articles/language-runtime-metrics-ruby
require 'barnes'
before_fork do
  # worker specific setup

  Barnes.start # Must have enabled worker mode for this to block to be called
end
