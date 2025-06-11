# app.rb
require 'sinatra'
require 'sinatra/activerecord'
require 'require_all'
require 'json'

set :database_file, 'config/database.yml'
set :port, 4567
set :bind, '0.0.0.0'

configure do
  enable :cross_origin
end

require_all 'models'
require_all 'services'
require_relative './controllers/schedules_controller'

before do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization'
end

get '/' do
  "App is running!"
end

get '/health' do
  status 200
  'Health Status OK 200'
end

get '/schedules' do
  SchedulesController.index
end

post '/schedules' do
  content_type :json
  SchedulesController.new.create(request).to_json
end

get '/schedules/:practitioner_id' do
  content_type :json
  SchedulesController.new.get_by_practitioner(params[:practitioner_id]).to_json
end



