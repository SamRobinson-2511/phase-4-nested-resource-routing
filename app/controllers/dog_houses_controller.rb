class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    dog_house = DogHouse.find_by(id:params[:id])
    render json: dog_house, status: :ok
  end

  private

  def render_not_found_response
    render json: { errors: dog_house.errors.full_messages}, status: 422
  end

end
