require 'spec_helper'

describe TweetsController do
  describe "fetching tweets" do
    it "fetches tweets using the tweet_fetcher service" do
      pattern_id = 3
      fake_tweets_fetcher = double("tweets_fetcher")
      expect(fake_tweets_fetcher).to receive(:fetch_new_tweets).with(pattern_id)
      controller.load_tweets_fetcher(fake_tweets_fetcher)

      get :fetch, :id => pattern_id

    end
  end

end
