require 'rails_helper'

describe 'POST Gym' do

  describe '#create', :type => :request do

  let!(:location) { FactoryBot.build(:location) }
  let!(:gym) { FactoryBot.build(:gym) }

    before do

      @gym_name,
      @gym_established = gym
                           .values_at :name,
                                      :established

      @gym_established_string = @gym_established.to_s()

      @location_street_address,
      @location_state_province,
      @location_city,
      @location_postal_code = location
                                .values_at :street_address,
                                           :state_province,
                                           :city,
                                           :postal_code

      post v1_gyms_path, params: {
        :name => @gym_name,
        :established => @gym_established,
        :street_address => @location_street_address,
        :state_province => @location_state_province,
        :city => @location_city,
        :postal_code => @location_postal_code
      }

      @response = response

      @response_name,
      @response_established,
      @response_location_id = JSON
                                .parse(response.body)
                                .values_at 'name',
                                           'established',
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

      it 'creates a gym with a name and established date' do
        expect(@response_name).to eql @gym_name
        expect(@response_established).to eql @gym_established_string
      end

      it 'saves location in its own table' do
        expect(@saved_street_address).to eql @location_street_address
        expect(@saved_state_province).to eql @location_state_province
        expect(@saved_city).to eql @location_city
        expect(@saved_postal_code).to eql @location_postal_code
      end

      it 'should return with a 201 response status' do
        expect(@response).to have_http_status :created
      end

    end

  end

  describe '#create', :type => :request do

    context 'when unsuccessful' do

      it 'returns a status code of 422' do
        post v1_gyms_path, params: {
          :name => 'Dan',
          :established => '1/11/2020',
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