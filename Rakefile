require "bundler/setup"
require "jekyll/task/i18n"

task default: 'assets:precompile'

namespace :assets do
  task :precompile do
    Rake::Task['clean'].invoke
    sh 'JEKYLL_ENV=production bundle exec jekyll build'
  end
end

desc 'Remove compiled files'
task :clean do
  sh "rm -rf #{File.dirname(__FILE__)}/_site/*"
end

Jekyll::Task::I18n.define do |task|
  task.locales = ["ja"]
  task.translator_name  = "Yohei Yasukawa"
  task.translator_email = "yohei@yasslab.jp"
  task.files =  Rake::FileList["**/*.md"]
  task.files -= Rake::FileList["_*/**/*.md"]
  task.locales.each do |locale|
    task.files -= Rake::FileList["#{locale}/**/*.md"]
  end
end

task :default => "jekyll:i18n:translate"
