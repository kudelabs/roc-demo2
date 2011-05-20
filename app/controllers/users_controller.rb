class UsersController < ApplicationController
  skip_before_filter :require_logged_in
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      login(@user)
      redirect_to root_path
    else
      @errors = @user.errors.full_messages.join("<br />")
      render :new
    end
  end
end
