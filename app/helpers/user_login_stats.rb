helpers do
  def user_login
    if session.has_key?(:user_name)
      current_login = session[:user_name]
    else
      current_login = session[:user_name] = @current_user.name
    end
    current_login
  end

  def logout
    session.delete(:user_name)
    session.delete(:user_id)
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end
end