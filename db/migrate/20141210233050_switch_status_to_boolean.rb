class SwitchStatusToBoolean < ActiveRecord::Migration
  def change
  	remove_column :friendships, :status
  	add_column :friendships, :accepted, :boolean
  end
end
