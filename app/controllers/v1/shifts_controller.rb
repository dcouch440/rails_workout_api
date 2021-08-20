class V1::ShiftsController < ApplicationController

  def status
    json_response(*Shift.add_visitation_status(visitation_params))
  end

  private

  def visitation_params
    params.permit %i[
      time
      employee_id
    ]
  end

end