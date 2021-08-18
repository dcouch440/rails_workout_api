class Location < ApplicationRecord

  has_one :gym, dependent: :destroy
  has_one :member, dependent: :destroy
  has_one :employee, dependent: :destroy

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
