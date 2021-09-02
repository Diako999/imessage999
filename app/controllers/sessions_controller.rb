class SessionsController < ApplicationController
  before_action :logged_in_require, only: [:new, :create]
  def new
  end
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "logged in was successful"
      redirect_to root_path
    else
      flash.now[:error] = "username or password was incorrect"
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "logged out successfully"
    redirect_to login_path
  end

  private
  def logged_in_require
    if loggedIn
      flash[:error] = "you are already logged in:) "
      redirect_to root_path
    end
  end
end
