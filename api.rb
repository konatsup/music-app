require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models'

get '/api/post' do
  post = Post.first
  response = {
    data: {
      title: post.title,
      description: post.description,
      image_url: post.image_url,
      music_url: post.music_url
    }
  }
  json response
end

get '/api/posts' do
  posts = Post.order("RANDOM()").limit(10)
  ary = []
  posts.each do |post|
    ary.push({
        title: post.title,
        description: post.description,
        image_url: post.image_url,
        music_url: post.music_url
    })
  end
  response = {
    posts: ary
  }
  json response
end
