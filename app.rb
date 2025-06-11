require 'sinatra'
require 'sinatra/activerecord'
require 'require_all'

set :database_file, 'config/database.yml'

require_all 'models'
require_all 'services'

get '/' do
  "App is running!"
end

get '/health' do
  status 200
  'Health Status OK 200'
end
