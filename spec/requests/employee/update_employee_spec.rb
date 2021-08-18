require 'rails_helper'

describe 'Update Employee', :type => :request do

  let!(:employee) { FactoryBot.create(:employee) }
  let!(:employee_id) { employee.id }
  let!(:successful_patch_params) {{ name: "Terry", employment_active: 'inactive' }}
  let!(:unsuccessful_patch_params) {{ name: "Terry", employment_active: 'not active' }}

  describe '#update' do

    context 'when successful' do

      it 'update a employee' do

        patch v1_employee_path(employee_id), params: successful_patch_params

        @response_name,
        @response_employment_active,
        @response_id = JSON
                         .parse(response.body)
                         .values_at 'name',
                                    'employment_active',
                                    'id'

        expect(@response_name).to eql successful_patch_params[:name]
        expect(@response_employment_active).to eql successful_patch_params[:employment_active]
        expect(@response_id).to eql employee_id

      end

    end

    context 'when unsuccessful' do

      it 'returns a status code of 422' do
        patch v1_employee_path(employee_id), params: unsuccessful_patch_params
        expect(response).to have_http_status 422
      end

    end

  end

end