require 'rails_helper'

describe 'DESTROY Employees' do

  describe '#destroy', :type => :request do

    let!(:employee) { FactoryBot.create(:employee) }
    let!(:employee_id) { employee.id }
    let!(:gym_id) { employee.gym_id }

    context 'when successful' do

      it 'it destroys and employee' do
        delete v1_gym_employee_path(gym_id, employee_id)
        expect(response).to have_http_status :no_content
      end

    end

  end

end