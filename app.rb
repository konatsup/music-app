require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?


get '/' do
  erb :index
end

get '/posts/new' do
  erb :new
end