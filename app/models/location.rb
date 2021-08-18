class Location < ApplicationRecord
  has_one :gym
  has_one :user
  has_one :employee

  before_save :add_slug

  private

  def add_slug
    self.slug = city.parameterize
  end
end
