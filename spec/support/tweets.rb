module Tweets
  def create_plain_tweet_for(user)
    tweet = tweets(:plain)
    tweet.user_id = user.id
    tweet.save
  end
end