class AttractionsController < ApplicationController
  before_action :is_admin?, only: [:new, :create, :edit, :update, :delete]
  before_action :logged_in



  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      flash.now[:error] = "Invalid"
      render :new
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def delete

  end

  private
  def is_admin?
    user = User.find(session[:user_id])
    if user.admin

    else
      flash.now.alert = "Not admin"
      redirect_to attractions_path
    end
  end

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end
end
