class RemoveUserAndParticipantsFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :user_id, :integer
  	remove_column :events, :participant_id, :integer
  end
end
