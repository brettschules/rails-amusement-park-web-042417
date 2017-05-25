class RidesController < ApplicationController
  def create
    ride = Ride.new(user_id: session[:user_id], attraction_id: params[:id])
    if !ride.take_ride
      flash[:sucess] = "Thanks for riding the #{ride.attraction.name}!"
      ride.save
      redirect_to user_path(session[:user_id])
    else
      flash[:notice] = "#{ride.take_ride}"
      redirect_to user_path(session[:user_id])
    end
  end
end
