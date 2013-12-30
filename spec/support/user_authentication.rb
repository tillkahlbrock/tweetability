module UserAuthentication
  def log_in username
    user = users(username)
    visit log_in_path
    fill_in "Username", :with => user.name
    fill_in "Password", :with => "secret"
    click_button "Login"
    user
  end

  def failed_log_in(username)
    user = users(username)
    visit log_in_path
    fill_in "Username", :with => user.name
    fill_in "Password", :with => "invalid"
    click_button "Login"
  end
end