class V1::VisitsController < ApplicationController

  def status
    json_response(*Visit.add_visitation_status(visitation_params))
  end

  private

  def visitation_params
    params.permit %i[
      time
      member_id
    ]
  end

end