class GymsController < ApplicationController

  def index
    json_response(Gym.all)
  end

  def show
    json_response(Gym.find(params[:id]))
  end

  def update
    json_response(Gym.find_and_update(update_params))
  end

  def destroy
    Gym.find(params[:id]).destroy!
    json_response({message: 'deleted'}, :no_content)
  end

  def create
    json_response(Gym.create_gym_with_location(gym_creation_params), :created)
  end

  private

  def update_params
    params.permit %i[
      name
      established
    ]
  end

  def gym_creation_params
    params.permit %i[
      street_address
      state_province
      city
      postal_code
      name
      established
    ]
  end

end