class MessagesController < ApplicationController
  before_filter :load_event

  def show
  	@message = Message.find(params[:id])
  end

  def create
  	@message = @event.messages.build(message_params)
  	@message.user = current_user
  		if @message.save
  			redirect_to event_path(@event), notice: 'Woo! Your message was added'
  		else
  			render 'events/show'
  		end
  end

  def new
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy
  end

private
	
	def message_params
		params.require(:message).permit(:body, :event_id, :user_id)
	end

	def load_event
		@event = Event.find(params[:event_id])
	end
end
