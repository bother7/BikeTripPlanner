class Api::V1::TripsController < ApplicationController

  def index
    @trips = Trip.all
    render json: @trips, status: 200
  end

  def create
    @trip = Trip.create(trip_params)
    render json: @trip, status: 201
  end

  def destroy
    @trip = Trip.findby(params[:id])
    byebug
  end

  private
  def trip_params
    params.require(:body).permit(:origin, :destination)
  end




end
