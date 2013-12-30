require 'spec_helper'

describe 'FetchingTweetsFlows' do
  describe 'Fetching tweets flow' do
    fixtures :users, :tweets

    it 'it redirects to the list of tweets for the current user after fetching tweets' do
      TweetsFetcher.any_instance.stub(:fetch_new_tweets)
      david = log_in :david
      create_plain_tweet_for(david)
      get fetch_user_tweets_path(david.id)
      assert_redirected_to list_user_tweets_path david.id
      get list_user_tweets_path david.id
      assert_select 'span', tweets(:plain).text
    end
  end
end