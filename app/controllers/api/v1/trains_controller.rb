class Api::V1::TrainsController < ApplicationController

  def index
    @trains = Train.all
    render json: @trains, status: 200
  end

end
