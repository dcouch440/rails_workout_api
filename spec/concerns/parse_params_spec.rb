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
    :name => 'Bobs Gym',
    :established => '1/11/1111'
  }}

  let!(:member_params){{
    :name => 'Bob',
    :membership_active => false
  }}

  let!(:location_gym_params){{
    **location_params,
    **gym_params,
  }}

  let!(:location_member_params){{
    **location_params,
    **member_params
  }}


  context 'when there are additional props' do

    describe '#parse_location' do

      it 'returns the correct arguments for Location' do
        expect(ParseParams::parse_location location_gym_params).to eql location_params
        expect(ParseParams::parse_location location_member_params).to eql location_params
      end

    end

    describe '#parse_gym' do

      it 'returns the correct arguments for Gym' do
        expect(ParseParams::parse_gym location_gym_params).to eql gym_params
      end

    end

    describe '#parse_member' do

      it 'returns the correct params for Member' do
        expect(ParseParams::parse_member location_member_params).to eql member_params
      end

    end

  end

end