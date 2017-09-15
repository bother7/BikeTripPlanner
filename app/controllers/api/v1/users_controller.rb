class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users, status: 200
  end

  def create
    user = User.find_or_create_by(email: user_params["body"])
    render json: user, status: 201
  end

  def update
    user = User.find_by(id: params["id"])
    station = Station.find_by(id: params["station"])
    user.station = station
    user.save
    render json: user, status: 201
  end
  # setup user params
  private

  def user_params
    params.permit(:body)
  end

end
