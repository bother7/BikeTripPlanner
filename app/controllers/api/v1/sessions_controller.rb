class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params["email"])
    session[:user_id] = user.id
    render json: user, status: 201
  end

  def destroy
    user = User.find_by(email: params[params["email"])
    session.delete
    render json: user, status: 201
  end
  # setup session params

end
