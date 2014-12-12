class ParticipationsController < ApplicationController
  before_filter :ensure_logged_in

  def index
  end

  def new
    @participation = Participation.new
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.user = current_user
      if @participation.save
        redirect_to events_path
      else
        render :new
      end
  end

  def show
  end


  def destroy
    @participation = Participation.find(params[:id])
    @participation.destroy
  end

private

  def participation_params
    params.require(:participation).permit(:event_id)
  end

end