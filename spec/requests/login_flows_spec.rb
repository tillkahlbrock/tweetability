require 'spec_helper'

describe "LoginFlows" do
  describe "Login Flows" do
    fixtures :users

    it "redirects to the login form if the log in failed" do
      david = users(:david)
      User.should_receive(:authenticate).and_return nil
      post_via_redirect "/sessions", name: david.name, password: david.password
      assert_equal '/sessions', path
      assert_equal 'Invalid username or password', flash[:alert]
    end

    it "redirects to the root path and displays a success message when the user logged in" do
      david = users(:david)
      User.should_receive(:authenticate).and_return david
      get log_in_path
      post_via_redirect "/sessions", name: david.name, password: david.password
      assert_equal '/', path
      assert_equal 'Logged in!', flash[:notice]
    end
  end
end
