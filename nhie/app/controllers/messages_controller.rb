class MessagesController < ApplicationController
  before_filter :load_event

  def show
  	@message = Message.find(params[:id])
  end

  def create
  	@message = @event.messages.build(message_params)
  	@message.user_id = current_user.id

    respond_to do |format|
  		if @message.save
        format.html { redirect_to event_path(@event), notice: 'Woo! Your message was added' }
  		  format.js 
      else
        format.html { render 'events/show', alert: 'There was a problem' }
        format.js
  		end
    end
  end

  def new
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy
  end

private
	def load_event
		@event = Event.find(params[:event_id])
	end
  
  def message_params
    params.require(:message).permit(:body, :event_id, :user_id)
  end
end
