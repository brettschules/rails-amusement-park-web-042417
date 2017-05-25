class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      flash[:sucess] = "Welcome to the theme park"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = "Invalid user/password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:name] = nil
    redirect_to root_path
  end
end
