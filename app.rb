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
    image_url: "",
    music_url: "https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/AudioPreview118/v4/4c/9b/f4/4c9bf4df-3b01-ffbd-6e9e-cf558ac7a4d9/mzaf_4294571228281925337.plus.aac.p.m4a"
  )
  if params[:image_file]
    image_upload(params[:image_file])
  end

  redirect '/'
end