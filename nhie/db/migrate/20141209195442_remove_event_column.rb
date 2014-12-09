class RemoveEventColumn < ActiveRecord::Migration
  def change
  		remove_column :events, :event 
  end
end