class Member < ApplicationRecord

  belongs_to :gym
  belongs_to :location

  has_many :visits, dependent: :destroy

  validates :membership_active, inclusion: [true, false]
  validates :membership_active, exclusion: [nil]

  validates *%i[
    name
    membership_active
  ], presence: true

  def self.create_member_with_location params
    location = ParseParams::parse_location params
    member = ParseParams::parse_member params
    Location.create!(location).create_member(member)
  end

end
