class UsersController < ApplicationController
  before_filter :ensure_logged_in, except: [:create, :new]
  def index
    @users = User.all
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
    @users = User.all
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
