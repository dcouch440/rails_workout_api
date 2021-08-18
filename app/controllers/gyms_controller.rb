class GymsController < ApplicationController

  def index
    json_response(Gym.all)
  end

  def create
    json_response(Gym.create_gym_with_location(gym_params), :created)
  end

  private

  def gym_params
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