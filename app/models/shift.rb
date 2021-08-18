class Shift < ApplicationRecord

  belongs_to :employee


  before_update :check_if_check_out_is_present
  validates :check_in, presence: true

  private

  def check_if_check_out_is_present
    if check_out.nil?
      errors.add(:check_out, 'check_out must be present in order to update')
    end
  end

end
