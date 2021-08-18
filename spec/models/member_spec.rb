require 'rails_helper'

RSpec.describe Member, type: :model do

  it { should belong_to :gym }
  it { should belong_to :location }
  it { should have_many :visits }

  %i[ name signed_up membership_active ].each do |property|
    it { should validate_presence_of property }
  end

  it { should validate_exclusion_of(:membership_active).in_array [nil] }

end
