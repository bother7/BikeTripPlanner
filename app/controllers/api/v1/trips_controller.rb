class Api::V1::TripsController < ApplicationController

  def index
    @trips = Trip.all
    render json: @trips, status: 200
  end

  def create
    @trip = Trip.create(trip_params)
    render json: @trip, status: 201
  end

  private
  def trip_params
    params.permit(:origin, :destination)
  end




end
