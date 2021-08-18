require 'rails_helper'

describe 'GET Employee', :type => :request do

  let!(:employee) { FactoryBot.create(:employee) }
  let!(:employment_active) { employee.employment_active }
  let!(:location_id) { employee.location_id }
  let!(:employee_name) { employee.name }

  describe '#index' do

    before do
      get v1_employees_path

      @response_name,
      @response_employment_active,
      @response_location_id = JSON
                                .parse(response.body)
                                .first()
                                .values_at 'name',
                                           'employment_active',
                                           'location_id'

    end

    it 'should return a employee' do
      expect(@response_name).to eql employee_name
      expect(@response_employment_active).to eql employment_active
      expect(@response_location_id).to eql location_id
    end

  end

end