class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:id]) if session[:id]
  end
  helper_method :current_user

  def require_login
  	redirect_to '/sessions/new' unless session[:id]
  end

  def require_correct_user
  	user = User.find(params[:id])
  	redirect_to "/users/#{session[:id]}" if current_user != user
  end
end
