class Api::V1::TripsController < ApplicationController

  def index
    @trips = Trip.all
    render json: @trips, status: 200
  end

  def create
    # You have your request object (params, session, cookies, ...)
    @trip = Trip.create(trip_params)
    # respond to the request with a new trip object as json and status code ...
    render json: @trip, status: 201
  end

  def destroy
    @trip = Trip.findby(params[:id])
  end



  private
  def trip_params
    params.require(:body).permit(:origin, :destination)
  end




end
