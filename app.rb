require 'sinatra'
require_relative 'tweet.rb'
require_relative 'random_tweet.rb'

# URL'/'でアクセス
get '/' do
  'under construction'
end

# URL '/random_tweet'でアクセス
get '/announcement' do
  Tweet.new.announcement
  'check todays curry'
  #'Cerrado'
end

# URL 'random_tweet'でアクセス
get '/random_tweet' do
  Tweet.new.random_tweet
  'check your random_tweet'
end
