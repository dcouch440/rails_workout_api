require 'rails_helper'

RSpec.describe Location, type: :model do

  let!(:location){ FactoryBot.create(:location) }

  it { should have_one :gym }
  it { should have_one(:member).dependent(:destroy) }
  it { should have_one(:employee).dependent(:destroy) }

  %i[ street_address state_province city postal_code ].each do |property|
    it { should validate_presence_of property }
  end

  context 'when saving' do

    it 'saves a parameterized slug from city' do
      parameterized_city = location.city.parameterize
      expect(location.slug).to eql parameterized_city
    end

  end

end
