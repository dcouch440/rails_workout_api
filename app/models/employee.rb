class Employee < ApplicationRecord

  belongs_to :gym
  belongs_to :location

  has_many :shifts, dependent: :destroy

  validates :employment_active, inclusion: ['active', 'inactive']

  validates_presence_of :hired
  validates_presence_of :name
  validates_presence_of :employment_active

  def self.create_employee_with_location params
    location = ParseParams::parse_location params
    employee = ParseParams::parse_employee params
    location = Location.create!(location)
    Gym.find(params[:gym_id]).employees.create!({ **employee, location_id: location.id })
  end

end
