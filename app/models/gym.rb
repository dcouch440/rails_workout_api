class Gym < ApplicationRecord
  belongs_to :location
  has_many :members
  has_many :employees

  def self.create_gym_with_location params
    location = {
      street_address: params[:street_address],
      state_province: params[:state_province],
      city: params[:city],
      postal_code: params[:postal_code]
    }
    gym = {
      name: params[:name],
      established: params[:established]
    }
    Location.create!(location).create_gym(gym)
  end

end
