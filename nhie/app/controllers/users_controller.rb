class UsersController < ApplicationController
  before_filter :ensure_logged_in, except: [:create, :new]
  def index
    @f = current_user.friends
    @ifr = current_user.incoming_friend_requests.map(&:friend)
    @ofr = current_user.outgoing_friend_requests.map(&:friend)
    @nf = User.all - @f - @ifr - @ofr - [current_user]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to events_url, {notice: "Signed up!"}
    else
      flash.now[:alert] = "Error: could not complete the request."
      render "new"
    end
  end

  def new
    @user = User.new
  end

  def show
    @users = User.all - [current_user]
    @user = User.find(params[:id])
  end

  def edit 
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :username, :image)
  end
end
