class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :check_if_admin?


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    unless !!current_user
      flash[:danger] = "You must be logged in"
      redirect_to root_path
    end
  end

  def check_if_admin?
    user = User.find(session[:user_id])
    user.admin
  end
end
