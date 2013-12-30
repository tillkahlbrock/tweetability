module UserAuthentication
  def log_in username
    user = users(username)
    post_via_redirect "/sessions", name: user.name, password: "secret"
    user
  end

  def failed_log_in(username)
    user = users(username)
    post_via_redirect "/sessions", name: user.name, password: "invalid"
  end
end