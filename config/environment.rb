# config/environment.rb
require 'yaml'
require 'sequel'

env = ENV['RACK_ENV'] || 'development'
db_config = YAML.load_file('config/database.yml')[env]

DB = Sequel.connect(
  adapter: db_config['adapter'],
  database: db_config['database'],
  host: db_config['host'],
  user: db_config['user'],
  password: db_config['password']
)

Sequel::Model.db = DB