class Api::V1::TrainsController < ApplicationController

  def index
    Updatetrain.query()
    @trains = Train.includes(:trainatstations).includes(:stations).all
    render json: @trains, status: 200
  end

end
