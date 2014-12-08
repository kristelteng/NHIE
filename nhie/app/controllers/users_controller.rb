class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to events_url, {notice: "Signed up!"}
    else
      render "new"
    end
  end

  def new
    @user = User.new
  end

  def show
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
