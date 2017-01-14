require 'twitter'
require 'yaml'

class Tweet

  def initialize
    keys = YAML.load_file('./config.yml')
    @text = [
      "がんばれニッポン！",
      "おいしいよ！",
      "また残業？困っちゃうね！",
      "月曜日の日替わりはチャナ豆とほうれん草のカレーだよ！",
      "火曜日の日替わりはキーマカリーだよ！",
      "水曜日の日替わりはマトンカリーだよ！",
      "木曜日の日替わりはバターチキンカリーだよ！",
      "金曜日の日替わりはほうれん草とチキンのカリーだよ！",
      "土曜日の日替わりは卵カリーだよ！",
      "日曜日はおやすみだよ！"
    ]

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
      puts "tweet!"
    rescue => e
      puts "エラーだよ" #TODO
    end
    puts "done"
  end
end

# random_tweetを実行する
if __FILE__ == $0
  Tweet.new.random_tweet
end
