require 'rails_helper'

describe 'POST Member' do

  describe '#create', :type => :request do

  let!(:gym) { FactoryBot.create(:gym) }
  let!(:location) { FactoryBot.build(:location) }
  let!(:member) { FactoryBot.build(:member) }

    before do

      @member_name,
      @membership_active = member
                             .values_at :name,
                                        :membership_active

      @location_street_address,
      @location_state_province,
      @location_city,
      @location_postal_code = location
                                .values_at :street_address,
                                           :state_province,
                                           :city,
                                           :postal_code

      post v1_gym_members_path(gym.id), params: {
        :name => @member_name,
        :membership_active => @membership_active,
        :street_address => @location_street_address,
        :state_province => @location_state_province,
        :city => @location_city,
        :postal_code => @location_postal_code
      }

      @response_name,
      @response_membership_active,
      @response_location_id = JSON
                                .parse(response.body)
                                .values_at 'name',
                                           'membership_active',
                                           'location_id'

      @saved_street_address,
      @saved_state_province,
      @saved_city,
      @saved_postal_code = Location
                             .find(@response_location_id)
                             .values_at :street_address,
                                        :state_province,
                                        :city,
                                        :postal_code
    end

    context 'when successful' do

      it 'creates a member with a name and membership_active date' do
        expect(@response_name).to eql @member_name
        expect(@response_membership_active).to eql @membership_active
      end

      it 'saves location in its own table' do
        expect(@saved_street_address).to eql @location_street_address
        expect(@saved_state_province).to eql @location_state_province
        expect(@saved_city).to eql @location_city
        expect(@saved_postal_code).to eql @location_postal_code
      end

    end

  end

  describe '#create', :type => :request do

    let!(:gym) { FactoryBot.create(:gym) }

    context 'when unsuccessful' do

      it 'returns a status code of 422' do
        post v1_gym_members_path(:gym), params: {
          :name => 'Dan',
          :membership_active => '1/11/2020',
          :street_address => '123 street',
          :state_province => 'CA',
          :city => '',
          :postal_code => 90210
        }
        expect(response).to have_http_status :unprocessable_entity
      end

    end

  end

end