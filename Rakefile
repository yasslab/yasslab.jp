require "bundler/setup"

# Tasks triggered by GitHub Actions
# https://github.com/yasslab/yasslab.jp/actions
desc "Upsert recent articles from YassLab's note RSS"
task :upsert_recent_notes, :number_of_articles do |task, args|
  ruby "tasks/upsert_recent_notes.rb #{args[:number_of_articles]}"
end

desc "Upsert recent press from YassLab's PR TIMES RSS"
task :upsert_recent_press, :number_of_articles do |task, args|
  ruby "tasks/upsert_recent_press.rb #{args[:number_of_articles]}"
end

desc "Share fetched recent articles from registered RSS"
task :share_rss_articles do |task, args|
  ruby "tasks/share_rss_articles.rb"
end

desc "Share daily updates in Gumroad by using Emoji"
task :share_gumroad_updates do |task, args|
  ruby "tasks/share_gumroad_updates.rb"
end

desc "Fetch and cache holidays from Japanese Cabinet Office (CAO)"
task :fetch_japanese_holidays do |task, args|
  ruby "tasks/fetch_japanese_holidays.rb"
end

desc "Share opt-in Health Planet user record"
task :share_health_planet do |task, args|
  ruby "tasks/share_health_planet.rb"
end
# NOTE: Want to pass variables? Here is the example:
# task :share_health_planet, [:user_name, :label_color] do |task, args|
#   p args.user_name
#   p args.label_color
# end

desc "Share today's summary from given calendar"
task :share_calendar_events do |task, args|
  ruby "tasks/share_calendar_events.rb"
end
namespace :share_calendar_events do
  desc "Share today's summary from given calendar (Sandbox)"
  task :sandbox do |task, args|
    ruby "tasks/share_calendar_events.rb SANDBOX"
  end

  desc "Share today's summary from given calendar (Sandbox)"
  task :test do |task, args|
    ruby "tasks/share_calendar_events.rb TEST"
  end
end

desc "Share inquiry from yasslab.jp"
task :share_inquiry do |task, args|
  ruby "tasks/share_inquiry.rb"
end

desc "Notify recent Twilio events to Slack"
task :notify_twilio_events do |task, args|
  load "tasks/notify_twilio_events.rb"
  Rake::Task["notify_twilio_events"].invoke
end

# NOTE: This before-hooked task affects on the tasks above.
#       So this needs to be here, not the end of this file.
desc "Set global env variables in GitHub Actions if necessary"
task :before_hook do
  ENV['TZ'] = 'Asia/Tokyo'
end
Rake.application.tasks.each do |task|
  next if task.name.include? 'before_hook'
  task.enhance [:before_hook]
end


# To deploy this website to Heroku
task default: 'assets:precompile'

# Override assets:precomiple in Heroku deployment
namespace :assets do
  task :precompile do
    sh 'JEKYLL_ENV=production bundle exec jekyll build'

    # NOTE: Heroku runs this in production but we use the packages over buildpacks
    # sh 'npm prune --production' if ENV['NPM_CONFIG_PRODUCTION'] == 'true'
  end
end

# cf. How to test a Jekyll site
# http://joenyland.me/blog/how_to_test_a_jekyll_site/
require 'html-proofer'
task test: [:build] do
  sh "bundle exec rake assets:precompile" unless ENV['SKIP_BUILD'] == 'true'

  require './test/custom_checks'
  options = {
    checks: ['Links', 'Images', 'Scripts', 'OpenGraph', 'Favicon', 'QiitaTeam'],
    allow_hash_href:     true,
    check_internal_hash: false, # NOTE: This raises error on correct internal hashes in Japanese
    disable_external:    ENV['TEST_EXTERNAL_LINKS'] != 'true',
    enforce_https:       false, # NOTE: Some websites in article not HTTPS
    ignore_files: [
      '_site/health.html',
      /google(.*)\.html/,
    ],
    ignore_urls: [
      # NOTE: 'Scripts' raises error on protocol-relative URLs,
      #       but it contradicts SpeakerDeck's default embed option.
      # e.g.: https://github.com/gjtorikian/html-proofer/issues/750
      %r{^//speakerdeck.com},
      /kit.fontawesome.com/,
    ],
    ignore_status_codes: [0, 500, 999],
  }

  HTMLProofer.check_directory('_site/', options).run
end

task build: [:clean] do
  system 'bundle exec jekyll build' unless ENV['SKIP_BUILD'] == 'true'
end

task :clean do
  system 'bundle exec jekyll clean' unless ENV['SKIP_BUILD'] == 'true'
end

#require "jekyll/task/i18n"
#Jekyll::Task::I18n.define do |task|
#  task.locales = ["ja"]
#  task.translator_name  = "Yohei Yasukawa"
#  task.translator_email = "yohei@yasslab.jp"
#  task.files =  Rake::FileList["**/*.md"]
#  task.files -= Rake::FileList["_*/**/*.md"]
#  task.locales.each do |locale|
#    task.files -= Rake::FileList["#{locale}/**/*.md"]
#  end
#end
#
#task default: "jekyll:i18n:translate"
