class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.string :status
      t.timestamps
    end
  end
end
