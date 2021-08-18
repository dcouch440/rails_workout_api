class Member < ApplicationRecord

  belongs_to :gym
  belongs_to :location

  has_many :visits

  validates :membership_active, inclusion: [true, false]
  validates :membership_active, exclusion: [nil]

  validates *%i[
    name
    signed_up
    membership_active
  ], presence: true

  before_save %i[
    downcase_membership
  ]

end
