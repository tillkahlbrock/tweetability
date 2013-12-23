require 'twitter'

class TweetsFetcher
  def fetch_new_tweets pattern_id
    @twitter_api ||= configure_twitter_client
    tweets = []
    tweet_maximum = Tweet.maximum("tid")
    last_id = tweet_maximum.nil? ? 1 : tweet_maximum
    options = {:since_id => last_id}
    @twitter_api.user_timeline('till_ka', options).each do |t|
      tweet = {:created => t.created_at, :text => t.full_text, :pattern_id => pattern_id, :tid => t.id}
      tweets.push tweet
    end
    Tweet.save_all(tweets)
    tweets
  end

  def configure_twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = AppConfig.twitter['consumer_key']
      config.consumer_secret     = AppConfig.twitter['consumer_secret']
      config.access_token        = AppConfig.twitter['access_token']
      config.access_token_secret = AppConfig.twitter['access_token_secret']
    end
  end
end