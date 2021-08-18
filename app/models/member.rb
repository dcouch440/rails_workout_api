class Member < ApplicationRecord

  belongs_to :gym
  has_many :visits

  validates *%i[
    name
    signed_up
    membership
  ], presence: true

  before_save %i[
    downcase_membership
  ]

  private

  def downcase_membership
    self.membership = membership.downcase
  end

end
