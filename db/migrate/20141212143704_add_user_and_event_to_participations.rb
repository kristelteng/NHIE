class AddUserAndEventToParticipations < ActiveRecord::Migration
  def change
	  create_table "participations", force: true do |t|
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.integer  "user_id"
	    t.integer  "event_id"
	  end
  end
end
