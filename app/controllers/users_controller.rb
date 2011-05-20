class UsersController < ApplicationController
  skip_before_filter :require_logged_in
  
  def new # show the sign up page
    @user = User.new
  end
  
  def create # register a new user
    @user = User.new(params[:user])
    
    if @user.save
      login(@user)
      redirect_to root_path
    else
      @errors = @user.errors.full_messages.join("<br />").html_safe
      render :new
    end
  end
end
