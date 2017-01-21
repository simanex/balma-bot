require 'sinatra'
require_relative 'tweet.rb'

# URL'/'でアクセス
get '/' do
  'under construction'
end

# URL '/random_tweet'でアクセス
get '/announcement' do
  Tweet.new.announcement
  'check your tweet'
  #'Cerrado'
end
