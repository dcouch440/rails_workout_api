class Member < ApplicationRecord

  belongs_to :gym
  belongs_to :location

  has_many :visits, dependent: :destroy

  validates :membership_active,
            inclusion: ['active', 'inactive']

  validates *%i[
    name
    membership_active
  ], presence: true

  def self.create_member_with_location location, member, gym_id
    location = Location.create!(location)
    Gym.find(gym_id).members.create!({ **member, location_id: location.id })
  end

end
