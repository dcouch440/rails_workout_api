require 'rails_helper'

describe 'POST Employee' do

  describe '#create', :type => :request do
  let!(:gym) { FactoryBot.create(:gym) }
  let(:location) { FactoryBot.build(:location) }
  let(:employee) { FactoryBot.build(:employee) }

    before do

      @employee_name,
      @employment_active,
      @hired = employee
                 .values_at :name,
                            :employment_active,
                            :hired
      @location_street_address,
      @location_state_province,
      @location_city,
      @location_postal_code = location
                                .values_at :street_address,
                                           :state_province,
                                           :city,
                                           :postal_code

      post v1_gym_employees_path(gym.id), params: {
        :name => @employee_name,
        :hired => @hired,
        :employment_active => @employment_active,
        :street_address => @location_street_address,
        :state_province => @location_state_province,
        :city => @location_city,
        :postal_code => @location_postal_code
      }


      @response_name,
      @response_employment_active,
      @response_location_id = JSON
                                .parse(response.body)
                                .values_at 'name',
                                           'employment_active',
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

      it 'creates a employee with a name and employment_active data' do
        expect(@response_name).to eql @employee_name
        expect(@response_employment_active).to eql @employment_active
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
    let!(:employee) { FactoryBot.create(:employee) }
    let!(:gym_id) { employee.gym_id }
    context 'when unsuccessful' do

      it 'returns a status code of 422' do
        post v1_gym_employees_path(gym_id), params: {
          :name => '',
          :hired => '',
          :employment_active => 'inactive',
          :street_address => '123 street',
          :state_province => 'CA',
          :city => 'CA',
          :postal_code => 90210
        }
        expect(response).to have_http_status :unprocessable_entity
      end

    end

  end

end