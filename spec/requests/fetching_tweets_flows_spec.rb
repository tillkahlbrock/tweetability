require 'spec_helper'

describe 'FetchingTweetsFlows' do
  describe 'Fetching tweets flow' do
    fixtures :users, :tweets

    it 'it redirects to the list of tweets for the current user after fetching tweets' do
      TweetsFetcher.any_instance.stub(:fetch_new_tweets)
      david = log_in :david
      create_plain_tweet_for(david)
      visit user_path(david.id)
      click_link "Fetch tweets"
      current_path.should eq list_user_tweets_path(david.id)
      page.should have_content tweets(:plain).text
    end
  end
end