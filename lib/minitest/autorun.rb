# HACK HACK HACK this overrides the default behavior of autorun!
# THe intent is that folks can safely leave in `require "minitest/auto_run"`
# and this will handle the setup that does without actually doing the test run,
# which the worker is responsible for managing.

begin
  require "rubygems"
  gem "minitest"
rescue Gem::LoadError
  # do nothing
end

require "minitest"
require "minitest/spec"
require "minitest/mock"
require "minitest/hell" if ENV["MT_HELL"]
