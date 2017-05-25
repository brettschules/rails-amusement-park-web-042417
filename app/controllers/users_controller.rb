class UsersController < ApplicationController
  before_action :logged_in, only: :show

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:sucess] = "Welcome to the theme park"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Invalid"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
