class EventsController < ApplicationController
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
  end

  def show
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to event_path
  end
end
