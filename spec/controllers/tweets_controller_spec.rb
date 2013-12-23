require 'spec_helper'

describe TweetsController do
  describe "fetching tweets" do
    it "fetches tweets using the tweet_fetcher service" do
      fake_tweets_fetcher = double("tweets_fetcher")
      expect(fake_tweets_fetcher).to receive(:fetch_new_tweets)
      controller.load_tweets_fetcher(fake_tweets_fetcher)

      get :fetch, :id => 1
    end
  end

end
