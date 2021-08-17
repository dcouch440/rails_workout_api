class Gym < ApplicationRecord
  belongs_to :location
  has_many :members
  has_many :employees
end
