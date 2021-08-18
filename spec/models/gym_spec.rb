require 'rails_helper'

RSpec.describe Gym, type: :model do

  it { should belong_to :location }
  it { should have_many(:members).dependent(:destroy) }
  it { should have_many(:employees).dependent(:destroy) }

  %i[ name established ].each do |property|
    it { should validate_presence_of property }
  end

end
