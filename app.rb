require 'sinatra'

get '/' do
  'Welcome to the Ruby App!'
end

get '/health' do
  status 200
  'Health Status OK'
end
