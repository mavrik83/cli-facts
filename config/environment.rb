require "pry"
require "httparty"
require "active_record"
require "sqlite3"
require "rake"
require "sinatra/activerecord"

# require "bundler"
# Bundler.require

require_relative '../lib/console_control'
require_relative '../lib/api'
require_relative '../lib/category'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/categories.sqlite"
)

