class Tweet < ActiveRecord::Base
  belongs_to :pattern

  def self.save_all tweets
    tweets.each do |t|
      tweet = Tweet.new(t)
      tweet.save
    end
  end
end
