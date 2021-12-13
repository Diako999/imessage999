class SessionsController < ApplicationController
  before_action :logged_in_require, only: [:new, :create]
  def new
  end
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      user.status = "online"
      user.save
      flash[:success] = "logged in was successful"
      redirect_to root_path
    else
      flash.now[:error] = "username or password was incorrect"
      render 'new'
    end
  end
  def destroy
    user = User.find_by(id: session[:user_id])
    session[:user_id] = nil
    user.status = "offline"
    user.save
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
