require "minitest/autorun"

require "minitest_worker"

class VersionTest < Minitest::Test
  extend Minitest::Spec::DSL

  let(:expensive) do
    cached = Thread.current[:expensive]
    next cached if cached

    sleep(1)

    Thread.current[:expensive] = "Whew!"
  end

  def test_version
    assert_equal "0.1.0", MinitestWorker::VERSION
  end

  def test_expensive
    assert_equal "Whew!", expensive
  end

  def test_cheaper
    assert_equal "Whew!", expensive
  end
end

Minitest.run(%w{-n /VersionTest.test_expensive|VersionTest.test_cheaper/})
Minitest.run(%w{-n /VersionTest.test_expensive|VersionTest.test_cheaper/})
