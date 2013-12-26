class TweetsController < ApplicationController
  before_filter :load_tweets_fetcher

  def fetch
    pattern_id = params[:id].to_i
    @tweets_fetcher.fetch_new_tweets pattern_id
    redirect_to list_pattern_tweets_path pattern_id
  end

  def list
    @tweets = Tweet.where :pattern_id => params[:pattern_id]
  end

  def load_tweets_fetcher(fetcher = TweetsFetcher.new)
    @tweets_fetcher ||= fetcher
  end
end
