require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models'
require './api'
require './image_uploader.rb'

require 'open-uri'
require 'net/http'
require 'json'

get '/' do
  erb :index
end

get '/posts/new' do
  erb :new
end

post '/posts/new' do
  post = Post.create(
    title: params[:title],
    description: params[:description],
    image_url: "http://res.cloudinary.com/konatsup/image/upload/v1551698056/elwqqjviuruatqb5rqi7.jpg",
    music_url: ""
  )
  if params[:image_file]
    image_upload(params[:image_file])
  end
  if params[:music_file]
    music_upload(params[:music_file])
  end

  redirect '/'
end