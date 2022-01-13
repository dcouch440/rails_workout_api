class LocationsController < ApplicationController
  include ParseParams

  def update
    Location.update_location(
      params[:employee_id],
      params[:member_id],
      params[:gym_id]
    )
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