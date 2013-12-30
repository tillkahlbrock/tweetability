require 'spec_helper'

describe "LoginFlows" do
  describe "Login Flows" do
    fixtures :users

    it "redirects to the login form if the log in failed" do
      failed_log_in(:david)
      assert_equal '/sessions', path
      assert_equal 'Invalid username or password', flash[:alert]
    end

    it "redirects to the root path and displays a success message when the user logged in" do
      log_in :david
      assert_equal '/', path
      assert_equal 'Logged in!', flash[:notice]
    end
  end
end
