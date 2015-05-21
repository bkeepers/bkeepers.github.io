#!/usr/bin/env rake

desc 'Runs the html-proofer test'
task :proofer do
  require 'html/proofer'

  # Ignore really old content for now
  ignores = %w(
    _site/blog/**/*.html
    _site/20{05,06,07,08,09,10}/**/*.html
  ).map {|p| Dir.glob(p) }.flatten

  HTML::Proofer.new('_site',
    :file_ignore => ignores,
    :check_html => true
  ).run
end

desc 'Builds the site'
task :build => :clean do
  sh 'bundle exec jekyll build'
end

desc 'Remove the output dir'
task :clean do
  FileUtils.rm_r('_site') if File.exist?('_site')
end

desc 'Runs the tests!'
task :test => [:build, :proofer]

task :default => :test
