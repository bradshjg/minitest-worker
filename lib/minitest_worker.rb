require "minitest"
require "socket"

require "minitest_worker/version"

module MinitestWorker
  class Error < StandardError; end

  def self.run
    Socket.unix_server_loop("/tmp/sock") do |sock, client_addrinfo|
      load(File.expand_path "lib/minitest_worker/version.rb")
      begin
        argv = sock.readline
        Minitest.run
      ensure
        sock.close
      end
    end
  end
end
