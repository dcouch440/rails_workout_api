class V1::EmployeesController < ApplicationController

  def index
    json_response(Employee.all)
  end

  def show
    json_response(Employee.find(params[:id]))
  end

  def update
    employee = Employee.find(params[:id])
    if employee.update!(update_params)
      json_response(employee)
    end
  end

  def destroy
    Employee.find(params[:id]).destroy!
    json_response({ message: 'deleted' }, :no_content)
  end

  def create
    json_response(Employee.create_employee_with_location(employee_creation_params), :created)
  end

  private

  def update_params
    params.permit %i[
      name
      hired
      employment_active
    ]
  end

  def employee_creation_params
    params.permit %i[
      street_address
      state_province
      city
      postal_code
      name
      hired
      employment_active
      gym_id
    ]
  end
end