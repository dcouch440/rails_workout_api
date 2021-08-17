class Employee < ApplicationRecord
  belongs_to :gym
  has_many :shifts
end
