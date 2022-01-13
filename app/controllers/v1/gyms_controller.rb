class V1::GymsController < ApplicationController

  def index
    json_response(Gym.all)
  end

  def show
    json_response(Gym.find(params[:id]))
  end

  def update
    gym = Gym.find(params[:id])
    if gym.update!(update_params)
      json_response(gym)
    end
  end

  def destroy
    Gym.find(params[:id]).destroy!
    json_response({ message: 'deleted' }, :no_content)
  end

  def create
    location = ParseParams.parse_location gym_creation_params
    gym = ParseParams.parse_gym gym_creation_params
    json_response(Gym.create_gym_with_location(location, gym), :created)
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