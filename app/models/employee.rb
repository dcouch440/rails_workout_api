class Employee < ApplicationRecord

  belongs_to :gym
  belongs_to :location

  has_many :shifts, dependent: :destroy

  validates :employment_active, inclusion: ['active', 'inactive']

  validates_presence_of :hired
  validates_presence_of :name
  validates_presence_of :employment_active

  def self.create_employee_with_location location, employee, gym_id
    location = Location.create!(location)
    Gym.find(gym_id).employees.create!({ **employee, location_id: location.id })
  end

end
