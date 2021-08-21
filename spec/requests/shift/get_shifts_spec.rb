require 'rails_helper'

describe 'GET Shift' do

  let!(:shift) { FactoryBot.create_list(:shift, 5) }
  let(:first_employee) { shift.first.employee_id }

  describe '#index', :type => :request do

    before do
      get v1_employee_shifts_path(first_employee)
      @response = JSON.parse(response.body)
    end

    it 'should return a member' do
      expect(@response).to be_kind_of Array
    end

  end

end