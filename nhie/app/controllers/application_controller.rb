class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ensure_logged_in
  	unless session[:user_id]
  		flash[:alert] = "Please log in"
  		redirect_to login_path
  	end
  end

end
