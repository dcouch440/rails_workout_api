class V1::ShiftsController < ApplicationController

  def index
    json_response(Employee.find(params[:employee_id]).shifts)
  end

  def update
    shift = Shift.find_shift_by_employee_and_shift_id(id_params[:employee_id], id_params[:id])
    shift.update!(update_params)
    json_response(shift)
  end

  def show
    shift = Shift.find_shift_by_employee_and_shift_id(id_params[:employee_id], id_params[:id])
    json_response(shift)
  end

  def status
    json_response(*Shift.add_visitation_status(
      shifts_params[:time],
      shifts_params[:employee_id]
    ))
  end

  private

  def id_params
    params.permit %i[
      employee_id
      id
    ]
  end

  def update_params
    params.permit %i[
      check_in
      check_out
    ]
  end

  def shifts_params
    params.permit %i[
      time
      employee_id
    ]
  end

end