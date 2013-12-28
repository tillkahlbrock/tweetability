require 'spec_helper'

describe "AuthorizeUser" do
  it "redirects to the login form if the user is not logged in" do
    user_id = 1
    user = User.new({:id => user_id, :name => 'some name', :handle => 'some handle', :password_hash => 'dsfjhdsjf', :password_salt => 'dsfjhdf'})
    user.save
    visit list_user_tweets_path(user_id)
    current_path.should eq log_in_path
  end
end