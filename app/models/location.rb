class Location < ApplicationRecord

  include ParseParams

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

  def self.update_location params

    employee_id = params[:employee_id]
    member_id = params[:member_id]
    gym_id = params[:gym_id]

    if employee_id
      employee_location = Employee.find(employee_id).location
      employee_location.update!(params)
      employee_location
    elsif member_id
      member_location = Member.find(member_id).Location
      member_location.update!(params)
      member_location
    elsif gym_id
      gym_location = Gym.find(gym_id).location
      gym_location.update!(params)
      gym_location
    end
  end

  def add_slug
    self.slug = city.parameterize
  end

end
