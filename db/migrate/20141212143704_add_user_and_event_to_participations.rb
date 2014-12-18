class AddUserAndEventToParticipations < ActiveRecord::Migration
  def change
  	add_column :participations, :user_id, :integer
  	add_column :participations, :event_id, :integer
  end
end
