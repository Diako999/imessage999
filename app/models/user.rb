class User < ApplicationRecord
  validates :username, presence:true, length: {minimum: 3, maximum:15}, uniqueness: true,
             uniqueness: {case_sensitive: false}
  has_many :messages
  has_many :friend_requests_as_sender, foreign_key: :sender, class_name: :FriendRequest
  has_many :friend_requests_as_reciever, foreign_key: :reciever, class_name: :FriendRequest
  has_secure_password


  def except_current_user(users)
    users.reject {|user| user.id == self.id}
  end
end
