class Api::V1::StationsController < ApplicationController

  def index

    @stations = Station.all
    render json: @stations, status: 200
  end



end
