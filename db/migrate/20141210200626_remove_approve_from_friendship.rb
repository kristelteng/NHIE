class RemoveApproveFromFriendship < ActiveRecord::Migration
  def change
    remove_column :friendships, :approved, :boolean
  end
end
