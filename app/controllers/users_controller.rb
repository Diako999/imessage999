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
  def online_users
    @online_users = User.where(status: "online")
    @online_users = current_user.except_current_user(@online_users)
    @requested_users = current_user.friend_requests_as_sender
    @user_list = []
    @requested_users.each do |user|
        @user_list.append(user.reciever.id)
    end
    if @online_users
      respond_to do |response|
        response.js {render partial: 'users/online_users'}
      end
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
