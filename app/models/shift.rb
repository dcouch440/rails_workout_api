class Shift < ApplicationRecord

  belongs_to :employee

  validates :check_in,
            presence: true

  validates :check_out,
            presence: true,
            on: :update

  def self.add_visitation_status time_update, employee_id
    employee = Employee.find(employee_id)
    shift = employee.shifts.last
    if shift == nil || shift['check_out'] != nil
      created_shift = employee.shifts.create!({ check_in: time_update })
      [ created_shift, :created ]
    else
      shift.update!({ check_out: time_update })
      [ shift, :ok ]
    end
  end

  def self.find_shift_by_employee_and_shift_id employee_id, id
    Employee.find(employee_id).shifts.find(id)
  end

end
