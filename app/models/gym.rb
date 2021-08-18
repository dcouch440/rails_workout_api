class Gym < ApplicationRecord

  include ParseParams

  belongs_to :location
  has_many :members
  has_many :employees

  def self.create_gym_with_location params
    location = ParseParams::parse_location params
    gym = ParseParams::parse_gym params
    Location.create!(location).create_gym(gym)
  end

end
