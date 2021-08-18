require 'rails_helper'

describe 'ParseParams' do

  include ParseParams

  let!(:location_params) {{
    :street_address => '123 street',
    :state_province => 'CA',
    :city => 'Los Angeles',
    :postal_code => 12312
  }}

  let!(:gym_params) {{
    :name => 'Bob',
    :established => '1/11/1111'
  }}

  describe '#parse_location' do

    context 'when there are additional props' do

      it 'return the correct arguments for Location' do
        params_with_location = { **location_params, **gym_params }
        expect(ParseParams::parse_gym params_with_location).to eql location_params
      end

    end

  end

  describe '#parse_gym' do

    context 'when there are additional props' do

      it 'return the correct arguments for Gym' do
        params_with_location = { **location_params, **gym_params }
        expect(ParseParams::parse_gym params_with_location).to eql gym_params
      end

    end

  end

end