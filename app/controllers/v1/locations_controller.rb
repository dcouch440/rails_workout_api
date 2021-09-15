class LocationsController < ApplicationController

  def update
    Location.update_location(update_params)
  end

  private

  def update_params
    params.permit %i[
      employee_id
      gym_id
      member_id
      street_address
      state_province
      city
      postal_code
    ]
  end

end