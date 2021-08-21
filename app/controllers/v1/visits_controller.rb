class V1::VisitsController < ApplicationController

  def index
    json_response(Member.find(params[:member_id]).visits)
  end

  def update
    visit = Visit.find_visit_by_member_and_visit_id id_params
    visit.update!(update_params)
    json_response(visit)
  end

  def show
    visit = Visit.find_visit_by_member_and_visit_id id_params
    json_response(visit)
  end


  def status
    json_response(*Visit.add_visitation_status(visitation_params))
  end

  private

  def id_params
    params.permit %i[
      member_id
      id
    ]
  end

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