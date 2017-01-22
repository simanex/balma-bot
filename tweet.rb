require 'twitter'
require 'yaml'
require 'date'

class Tweet

  def initialize
    keys = YAML.load_file('./config.yml')
    @daily_curry = ["おやすみ", "チャナ豆とほうれん草のカレー", "キーマカレー", "ポークカレー", "バターチキンカレー", "ほうれん草とチキンのカレー", "卵カレー"]

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["API_KEY"]
      config.consumer_secret = ENV["API_SECRET"]
      config.access_token = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
  end

  def announcement
    curry_today = @daily_curry[DateTime.now.wday]
    tweet = "そろそろお昼だね！今日の日替わりは" + curry_today + "だよ！"
    # tweet = curry_today + DateTime.now.to_s
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

# announcementを実行する
if __FILE__ == $0
  Tweet.new.announcement
end
