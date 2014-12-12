class EventsController < ApplicationController
  before_filter :ensure_logged_in

  def index
    @events = if params[:search]
      Events.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Event.order("events.created_at DESC")
    end.page(params[:page])
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

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to event_path
  end

private
  def event_params
    params.require(:event).permit(:event_name, :description, :event_datetime, :location, :url, :creator_id)
  end
end