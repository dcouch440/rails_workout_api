class Member < ApplicationRecord

  belongs_to :gym
  belongs_to :location

  has_many :visits

  validates :membership_active, inclusion: [true, false]
  validates :membership_active, exclusion: [nil]

  validates *%i[
    name
    membership_active
  ], presence: true

  def self.create_employee_with_location params
    location = ParseParams::parse_employee params
    gym = ParseParams::parse_gym params
    Location.create!(location).create_gym(gym)
  end

end
