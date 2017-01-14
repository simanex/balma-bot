require 'sinatra'
require_relative 'tweet.rb'

# URL'/'でアクセス
get '/' do
  'under construction'
end

# URL '/random_tweet'でアクセス
get '/random_tweet' do
  Tweet.new.random_tweet
  'check your tweet'
end
