class Gym < ApplicationRecord

  include ParseParams

  belongs_to :location
  has_many :members, dependent: :destroy
  has_many :employees, dependent: :destroy

  validates *%i[
    name
    established
  ], presence: true

  def self.find_and_update params
    Gym.find(params[:id]).update!(update_params)
  end

  def self.create_gym_with_location params
    location = ParseParams::parse_location params
    gym = ParseParams::parse_gym params
    Location.create!(location).create_gym(gym)
  end

end
