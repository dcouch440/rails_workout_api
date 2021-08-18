class Employee < ApplicationRecord

  belongs_to :gym
  belongs_to :location

  has_many :shifts, dependent: :destroy

  validates :employment_active, inclusion: ['active', 'inactive']

  validates *%i[
    name
    hired
    employment_active
  ], presence: true

end
