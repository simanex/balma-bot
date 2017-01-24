require 'twitter'
require 'yaml'
require 'date'

class Tweet

  def initialize
    keys = YAML.load_file('./config.yml')
    @tweet = [
      "がんばれニッポン！",
      "また残業？困っちゃうね！",
      "また残業？おまけにマンゴーラッシーあげるからがんばって！",
      "げんき？わたしはげんき！",
      "ランチボックス夜でもあるよ！"
    ]

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["API_KEY"]
      config.consumer_secret = ENV["API_SECRET"]
      config.access_token = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
  end

  def random_tweet
    tweet = @tweet[rand(@tweet.length)]
    update(tweet)
  end

  private

  def update(tweet)
    begin
      @client.update(tweet)
    rescue => e
      nil #TODO
    end
  end
end

# random_tweetを実行する
if __FILE__ == $0
  Tweet.new.random_tweet
end
