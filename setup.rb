require 'active_record'
ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

# Uncomment this if you want to see the logs of the SQL queries
# require 'logger'
# ActiveRecord::Base.logger = Logger.new $stdout
# ActiveSupport::LogSubscriber.colorize_logging = false

