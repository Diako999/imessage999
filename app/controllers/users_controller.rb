class UsersController < ApplicationController
  before_action :signup_required, only: [:new, :create]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "user created successfully.. now you can login:)"
      redirect_to login_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
  def signup_required
    if loggedIn
      flash[:error] = "you are already signed up :) "
      redirect_to root_path
    end
  end
end
