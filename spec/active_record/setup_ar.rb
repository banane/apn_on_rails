require 'rubygems'
require 'active_record'
require 'logger'


logger = Logger.new(STDOUT)
logger.level = Logger::INFO
ActiveRecord::Base.logger = logger

db_file = File.join(File.dirname(__FILE__), 'test.db')
FileUtils.rm(db_file) if File.exists?(db_file)

ActiveRecord::Base.establish_connection({
  :adapter => 'sqlite3',
  :database => db_file
})

ActiveRecord::Migrator.up(File.join(File.dirname(__FILE__), '..', '..', 'generators', 'templates', 'apn_migrations'))

# raise hell