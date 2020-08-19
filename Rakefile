require "bundler/setup"
#require "jekyll/task/i18n"

# Tasks triggered by GitHub Actions
# https://github.com/yasslab/yasslab.jp/actions
desc "Upsert recent articles from YassLab's note RSS"
task :upsert_recent_notes, :number_of_articles do |task, args|
  ruby "tasks/upsert_recent_notes.rb #{args[:number_of_articles]}"
end

desc "Share fetched recent articles from registered RSS"
task :share_from_rss do |task, args|
  ruby "tasks/share_from_rss.rb"
end

desc "Share daily updates in Gumroad by using Emoji"
task :share_gumroad_updates do |task, args|
  ruby "tasks/share_gumroad_updates.rb"
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

# NOTE: This before-hooked task affects on the tasks above.
#       So this needs to be here, not the end of this file.
desc "Set global env variables in GitHub Actions if necessary"
task :before_hook do
  ENV['TZ'] = 'Asia/Tokyo'
end
Rake.application.tasks.each do |task|
  next if task.name.include? 'before_hook'
  p task
  task.enhance [:before_hook]
end




# To deploy this website to Heroku
task default: 'assets:precompile'

# Override assets:precomiple in Heroku deployment
namespace :assets do
  task :precompile do
    sh 'JEKYLL_ENV=production bundle exec jekyll build'

    # Shaped up npm modules ;) So 'npm prune' does not save so much.
    # sh 'npm prune --production' if ENV['NPM_CONFIG_PRODUCTION'] == 'false'
  end
end

# cf. How to test a Jekyll site
# http://joenyland.me/blog/how_to_test_a_jekyll_site/
require 'html-proofer'
task test: [:build] do
  sh "bundle exec rake assets:precompile" unless ENV['SKIP_BUILD'] == '1'

  require './test/custom_checks'
  options = {
    allow_hash_href:  true,
    assume_extension: true,
    check_opengraph:  true,
    check_favicon:    true,
    check_html:       true,
    # checks_to_ignore: %w(ImageCheck), # for debugging
    disable_external: true,
    file_ignore: [
      /node_modules/,
      "./_site/ja/workshops/raspi/index.html",
      "./_site/en/workshops/raspi/index.html",
      "./_site/ja/workshops/tickle/index.html",
      "./_site/google02f5cc9ed3681f94.html",
      /google(.*)\.html/,
    ],
    url_ignore:  %w(coderdojo.com linkedin.com),
    http_status_ignore: [0, 500, 999],
  }

  HTMLProofer.check_directory('./_site', options).run
end

task build: [:clean] do
  system 'bundle exec jekyll build'
end

task :clean do
  system 'bundle exec jekyll clean'
end

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
