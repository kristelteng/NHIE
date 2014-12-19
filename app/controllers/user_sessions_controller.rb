class UserSessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:username], params[:password], params[:remember_me])
      redirect_to(root_url)
    else
      flash.now[:alert] = "Login failed!"
      render "new"
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end

