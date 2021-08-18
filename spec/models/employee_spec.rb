require 'rails_helper'

RSpec.describe Employee, type: :model do

  it { should belong_to :gym }
  it { should belong_to :location }
  it { should have_many(:shifts).dependent(:destroy) }

  %i[ name hired employment_active ].each do |property|
    it { should validate_presence_of property }
  end

end
