#!/usr/bin/env rake

desc 'Runs the html-proofer test'
task :proofer do
  require 'html/proofer'

  HTML::Proofer.new('./_site',
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
