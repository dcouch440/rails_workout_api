require 'rails_helper'

RSpec.describe Member, type: :model do

  it { should belong_to :gym }
  it { should belong_to :location }
  it { should have_many(:visits).dependent(:destroy) }

  %i[ name membership_active ].each do |property|
    it { should validate_presence_of property }
  end

end
