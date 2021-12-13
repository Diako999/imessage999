class FriendRequestController < ApplicationController
  def create
    @friend_request = FriendRequest.new(friend_request_params)
    if @friend_request.save
        flash[:now] = "friend request sent successfully"
        redirect_to root_path
    end
  end

  private
  def friend_request_params
    params.permit(:sender_id, :reciever_id)
  end
end
