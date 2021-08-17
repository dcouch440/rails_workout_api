class Member < ApplicationRecord
  belongs_to :gym
  has_many :visits
end
