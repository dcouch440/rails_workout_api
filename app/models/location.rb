class Location < ApplicationRecord
  has_one :gym
  has_one :user
  has_one :employee
end
