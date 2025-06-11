require 'sinatra'
require 'sinatra/json'
require_relative './app/controllers/schedules_controller'

set :port, 4567
set :bind, '0.0.0.0'

post '/schedules' do
  SchedulesController.create(request, response)
end

get '/schedules/:provider_id' do
  SchedulesController.get_by_provider(params[:provider_id])
end