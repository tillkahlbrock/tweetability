class TweetsController < ApplicationController
  before_filter :load_tweets_fetcher

  def fetch
    user_id = params[:user_id].to_i
    @tweets_fetcher.fetch_new_tweets user_id
    redirect_to list_user_tweets_path user_id
  end

  def list
    @tweets = Tweet.where :user_id => params[:user_id]
  end

  def load_tweets_fetcher(fetcher = TweetsFetcher.new)
    @tweets_fetcher ||= fetcher
  end
end
