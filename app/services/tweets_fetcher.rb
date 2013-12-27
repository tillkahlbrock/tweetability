require 'twitter'

class TweetsFetcher

  def initialize(client = load_twitter_client)
    @twitter_api = client
  end

  def fetch_new_tweets user_id
    tweets = []
    tweet_maximum = Tweet.maximum("tid")
    last_id = tweet_maximum.nil? ? 1 : tweet_maximum
    options = {:since_id => last_id}
    @twitter_api.user_timeline('till_ka', options).each do |t|
      tweet = {:created => t.created_at, :text => t.full_text, :user_id => user_id, :tid => t.id}
      tweets.push tweet
    end
    Tweet.save_all(tweets)
    tweets
  end

  def load_twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end
end