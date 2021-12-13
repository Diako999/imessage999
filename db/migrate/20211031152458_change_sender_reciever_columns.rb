class ChangeSenderRecieverColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :friend_requests, :sender_id, :string
    change_column :friend_requests, :reciever_id, :string
  end
end
