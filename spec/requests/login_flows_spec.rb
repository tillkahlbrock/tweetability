require 'spec_helper'

describe "LoginFlows" do
  describe "Login Flows" do
    fixtures :users

    it "redirects to the login form if the log in failed" do
      failed_log_in(:david)
      current_path.should eq '/sessions'
      page.should have_content 'Invalid username or password'
    end

    it "redirects to the root path and displays a success message when the user logged in" do
      log_in :david
      current_path.should eq root_path
      page.should have_content 'Logged in!'
    end
  end
end
