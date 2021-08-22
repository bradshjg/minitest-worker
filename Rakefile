require "bundler/gem_tasks"
require "rake/testtask"

require "minitest_worker"

task default: :test

Rake::TestTask.new do |t|
  t.pattern = 'test/*_test.rb'
end

task :demo do
  FileList['test/*_test.rb'].to_a.each do |file|
    require File.expand_path file
  end

  MinitestWorker.run
end
