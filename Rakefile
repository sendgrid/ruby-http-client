require 'rake/testtask'
require 'github_changelog_generator/task'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'run rubocop'
task :rubocop do
  sh 'rubocop -c .rubocop.yml --display-only-fail-level-offenses -D'
end

desc 'run rubocop w/autocorrect'
task :rubocorrect do
  sh 'rubocop -c .rubocop.yml -a'
end

desc 'run minitest'
task :minitest do
  Rake::Task[:test].invoke
end

desc 'Run tests'
task default: 'test:quick'

namespace :test do
  desc 'Run all the quick tests'
  task :quick do
    Rake::Task['rubocop'].invoke
    Rake::Task['minitest'].invoke
  end
end

desc 'Generate changelog'
GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  config.user = 'sendgrid'
  config.project = 'ruby-http-client'
  config.unreleased = false
end
