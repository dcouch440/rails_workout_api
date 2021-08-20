class Shift < ApplicationRecord

  include ParseParams

  belongs_to :employee

  validates :check_in,
            presence: true

  validates :check_out,
            presence: true,
            on: :update

  def self.add_visitation_status params
    time_update = params[:time]
    employee = Employee.find(params[:employee_id])
    shift = employee.shifts.last
    if shift == nil || shift['check_out'] != nil
      created_shift = employee.shifts.create!({ check_in: time_update })
      [ created_shift, :created ]
    else
      shift.update!({ check_out: time_update })
      [ shift, :ok ]
    end
  end

end
