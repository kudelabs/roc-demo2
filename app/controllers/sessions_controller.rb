class SessionsController < ApplicationController
  skip_before_filter :require_logged_in
  
  def destroy # logout
    session[:user_id] = nil
    
    redirect_to login_path
  end
  
  def create # login
    user = User.find_by_email_and_password(params[:email], params[:password])
    
    if user
      session[:user_id] = user.id
    
      redirect_to root_path
    else
      @errors = "Email or password is wrong."
      render :new
    end
  end
  
end
