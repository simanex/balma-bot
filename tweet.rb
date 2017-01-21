require 'twitter'
require 'yaml'
require 'date'

class Tweet

  def initialize
    keys = YAML.load_file('./config.yml')
    @daily_curry = [
      "おやすみ",
      "チャナ豆とほうれん草のカレー",
      "キーマカレー",
      "ポークカレー",
      "バターチキンカレー",
      "ほうれん草とチキンのカレー",
      "卵カレー"
    ]

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = keys["api_key"]
      config.consumer_secret = keys["api_secret"]
      config.access_token = keys["access_token"]
      config.access_token_secret = keys["access_token_secret"]
    end
  end

  def announcement
    daily_curry = @daily_curry[DateTime.now.wday]
    tweet = "そろそろお昼だね！今日の日替わりは" + daily_curry + "だよ！"
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
  Tweet.new.announcement(daily_curry)
end
