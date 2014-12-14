class EventsController < ApplicationController
  before_filter :ensure_logged_in

  def index
    @events = if params[:search]
    Event.where("LOWER(event_name) LIKE LOWER(?)", "%#{params[:search]}%")
     else
       Event.order("events.created_at DESC")
     end.page(params[:page])
    @friends_events = current_user.friends.map(&:created_events).flatten

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