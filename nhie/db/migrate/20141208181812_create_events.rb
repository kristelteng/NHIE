class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event      
      t.text :description
      t.datetime :event_datetime
      t.string :location
      t.string :url
      
      t.timestamps
    end
  end
end
