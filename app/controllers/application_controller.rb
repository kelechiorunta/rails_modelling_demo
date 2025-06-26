class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?

  # Initiate a session
  def remember(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
    cookies.permanent[:user_id] = user.id
  end

  # Terminate a session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Get the current logged in user
  def current_user
    @current_user ||= begin
      user = User.find_by(id: cookies[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        user
      end
    end
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: "Please sign in"
    end
  end
end
