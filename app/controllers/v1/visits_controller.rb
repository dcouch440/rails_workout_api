class V1::VisitsController < ApplicationController

  def index
    json_response(Member.find(params[:member_id]).visits)
  end

  def update
    visit = Member.find(params[:member_id]).visits.find(params[:id])
    visit.update!(update_params)
    json_response(visit)
  end

  def status
    json_response(*Shift.add_visitation_status(visitation_params))
  end

  def status
    json_response(*Visit.add_visitation_status(visitation_params))
  end

  private

  def update_params
    params.permit %i[
      check_in
      check_out
    ]
  end

  def visitation_params
    params.permit %i[
      time
      member_id
    ]
  end

end