class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  protect_from_forgery
  
  before_filter :require_logged_in
  
  def current_user
    return nil unless session[:user_id]
    @user ||= User.find_by_id(session[:user_id])
  end
  
  def logged_in?
    current_user != nil
  end
  
  def login(user)
    session[:user_id] = user
  end
  
  def require_logged_in
    return if logged_in?
    
    redirect_to new_session_path
  end
  
end
