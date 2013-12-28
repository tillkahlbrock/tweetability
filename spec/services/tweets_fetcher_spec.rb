require 'rspec-rails'

describe 'Fetch Tweets' do
  it 'should use the twitter api client to fetch new tweets' do
    twitter_api_client = double("twitter")
    expect(twitter_api_client).to receive(:user_timeline).and_return([])
    tweets_fetcher = TweetsFetcher.new(twitter_api_client)
    tweets_fetcher.fetch_new_tweets(1)
  end

  it 'should only fetch tweets that are not fetch yet' do
    Tweet.should_receive(:maximum).and_return(12221)
    twitter_api_client = double("twitter")
    expect(twitter_api_client).to receive(:user_timeline).with(anything(), {:since_id => 12221}).and_return([])
    tweets_fetcher = TweetsFetcher.new(twitter_api_client)
    tweets_fetcher.fetch_new_tweets(1)
  end
end