class AddCreatorAndParticipantToEvent < ActiveRecord::Migration
  def change
	  add_column :events, :creator_id, :integer
	  add_column :events, :participant_id, :integer
  end
end
