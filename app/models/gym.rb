class Gym < ApplicationRecord

  include ParseParams

  belongs_to :location
  has_many :members, dependent: :destroy
  has_many :employees, dependent: :destroy

  validates *%i[
    name
    established
  ], presence: true

  def self.create_gym_with_location params
    location = ParseParams.parse_location params
    gym = ParseParams.parse_gym params
    location = Location.create!(location)
    location.create_gym!(gym)
  end

end
