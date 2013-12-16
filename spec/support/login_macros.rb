module LoginMacros
  def set_user_session(user)
    session[:session_id] = user.id
  end
end
