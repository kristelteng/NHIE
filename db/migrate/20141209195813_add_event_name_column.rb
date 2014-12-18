class AddEventNameColumn < ActiveRecord::Migration
  def change
  	add_column :events, :event_name, :string
  end
end
