class SearchesController < ApplicationController

	def users
	end

	def events
	end

	def friends_events
	end

	def all
		query = params[:query].downcase
		like_query = "%#{query}%"

    @friends_events = current_user.friends.map(&:created_events).flatten
    @created_events = current_user.created_events

    @friend_event_matches = Event.where("id in (?) AND LOWER(event_name) LIKE ?", @friends_events.map(&:id), like_query)
    @created_event_matches = Event.where("id in (?) AND LOWER(event_name) LIKE ?", @created_events.map(&:id), like_query)

    @friend_matches = current_user.friends.select { |u| u.username.downcase[params[:query]] }
		@user_matches = User.where("LOWER(username) LIKE ?", like_query) - current_user.friends
	end
end
