require 'rails_helper'

describe 'SHOW Employee', :type => :request do
  let!(:employees) { FactoryBot.create_list(:employee, 10) }
  let!(:first_employee_id) { employees.first.id }
  let!(:last_employee_id) { employees.last.id }

  describe '#employee' do

    context 'when successful' do

      it 'returns the first indexed employee' do
        get v1_employee_path(first_employee_id)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['id']).to eql first_employee_id
        expect(response).to have_http_status :ok
      end

      it 'returns the last indexed employee' do
        get v1_employee_path(last_employee_id)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['id']).to eql last_employee_id
        expect(response).to have_http_status :ok
      end

    end

    context 'when unsuccessful' do

      it 'returns the an error code of 404' do
        get v1_employee_path(last_employee_id + 1)
        expect(response).to have_http_status :not_found
      end

    end

  end

end