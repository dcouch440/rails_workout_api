class Location < ApplicationRecord

  has_one :gym
  has_one :member
  has_one :employee

  before_save :add_slug

  validates *%i[
    street_address
    state_province
    city
    postal_code
  ], presence: true

  private

  def add_slug
    self.slug = city.parameterize
  end

end
