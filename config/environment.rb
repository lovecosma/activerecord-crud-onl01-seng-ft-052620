require 'bundler/setup'
require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'
require_relative '../app/models/movie.rb'

Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'

sql = <<-SQL
CREATE TABLE IF NOT EXISTS movies (
  id INTEGER PRIMARY KEY,
  title TEXT,
  release_date INTEGER,
  director TEXT,
  lead TEXT,
  in_theaters BOOLEAN
  )
SQL

ActiveRecord::Base.connection.execute(sql)
