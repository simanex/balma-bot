require 'twitter'
require 'yaml'

class Tweet

  def initialize
    keys = YAML.load_file('./config.yml')
    @text = ["がんばれニッポン！", "おいしいよ！", "また残業？困っちゃうね！"]

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = keys["api_key"]
      config.consumer_secret = keys["api_secret"]
      config.access_token = keys["access_token"]
      config.access_token_secret = keys["access_token_secret"]
    end
  end

  def random_tweet
    tweet = @text[rand(@text.length)]
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
