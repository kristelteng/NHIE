class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => 'User', :foreign_key =>'friend_id'

	def deny!
		destroy
	end

	def inspect
		"<from: #{user.inspect} to #{friend.inspect} (accepted: #{accepted})>"
	end
end

