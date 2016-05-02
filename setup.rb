require 'active_record'
ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

# Uncomment this if you want to see the logs of the SQL queries
# require 'logger'
# ActiveRecord::Base.logger = Logger.new $stdout
# ActiveSupport::LogSubscriber.colorize_logging = false


class Minitest::Test
  # order tests so that we can use --fail-fast
  def self.runnable_methods
    instance_methods.grep(/^test_/)
  end
end

RSpec.configure do |config|
  config.fail_fast = true
end
