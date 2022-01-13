class Gym < ApplicationRecord

  belongs_to :location
  has_many :members, dependent: :destroy
  has_many :employees, dependent: :destroy

  validates *%i[
    name
    established
  ], presence: true

  def self.create_gym_with_location location, gym
    location = Location.create!(location)
    location.create_gym!(gym)
  end

end
