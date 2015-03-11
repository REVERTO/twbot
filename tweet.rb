require 'rubygems'
require 'twitter'
class Tweet
  def initialize
    @text = <<-EOF.split("\n")
    「男女同権」とは、男の地位が女の地位まで上がったことなのです。
    戦争は嫌でございます。親孝行ができませんし、なにしろ散らかしますから。
    手ぶらで訪問すれば「先生はお昼寝の最中です」と言われるが、贈り物を手にして訪問すれば「先生、どうぞお入り下さい」と言われる。
    １試合にわたって集中力を維持するためには、適度にリラックスすることが絶対に必要だと思う。
    ３０分ぐらいでは何もできないと考えているより、世の中の一番つまらぬことでもする方がまさっている。
    貴方が今、夢中になっているものを大切にしなさい。それは貴方が真に求めているものだから。
    貴方と世の中との戦いなら、世の中のほうに賭けなさい。
EOF

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'cMl1Y5sckDKNqlSsKXeD48TzE'
      config.consumer_secret     = 'FGHZNL4yn6WGO6hkva2noew6XyAyhgClYJ2xzyyVj17R6Jvq3Q'
      config.access_token        = '2710778737-XHos7DGHzkmCcR6hYcqlf59yGu6KriiNzgiiAU3'
      config.access_token_secret = 'uMKdskj3lec9EsfLuXQSQC0kHjsYHkY2m0oC7LCnHGRpZ'
    end

  end
  def random_tweet
    tweet = @text[rand(@text.length)]
    update(tweet)
  end
  def daily_tweet
    tweet = @text[Time.now.day - 1]
    update(tweet)
  end
  private
  def update(tweet)
    return nil unless tweet
    begin
      @client.update(tweet.chomp)
    rescue => ex
      nil # todo
    end
  end
end
