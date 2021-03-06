class EventsController < ApplicationController
  before_filter :ensure_logged_in

  def index
    @friends_events = current_user.friends.map(&:created_events).flatten
    @created_events = current_user.created_events
    if params[:search]
      @friends_events = Event.where("id in (?) AND LOWER(event_name) LIKE LOWER(?)", @friends_events.map(&:id), "%#{params[:search]}%")
      @created_events = Event.where("id in (?) AND LOWER(event_name) LIKE LOWER(?)", @created_events.map(&:id), "%#{params[:search]}%")
    end
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end


  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    if @event.save
      redirect_to events_url(@event.id)
    else 
      render :new
    end
  end

  def join
    event = Event.find(params[:event_id])
    current_user.participate_in!(event)
    redirect_to current_user
  end

  def leave
    event = Event.find(params[:event_id])
    current_user.un_participate_in!(event)
    redirect_to current_user
  end

  def show
    @event = Event.find(params[:id])

    if current_user
      @message = @event.messages.build
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

private
  def event_params
    params.require(:event).permit(:event_name, :description, :event_datetime, :location, :url, :creator_id)
  end
end