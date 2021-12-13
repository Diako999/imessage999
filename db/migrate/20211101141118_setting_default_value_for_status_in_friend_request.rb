class SettingDefaultValueForStatusInFriendRequest < ActiveRecord::Migration[5.2]
  def change
    change_column :friend_requests, :status, :string, default: "pending"
  end
end
