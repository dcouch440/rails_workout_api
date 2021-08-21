require 'rails_helper'

describe 'SHOW Shift' do

  describe '#show', :type => :request do

    let!(:shift) { FactoryBot.create(:shift) }
    let!(:employee_id) { shift.employee_id }
    let!(:shift_id) { shift.id }

    context 'when successful' do

      it 'shows a shift' do
        get v1_employee_shift_path(employee_id, shift_id)
        res = JSON.parse(response.body)

        response_employee_id = res['employee_id']
        response_shift_id = res['id']

        expect(response_employee_id).to eql employee_id
        expect(response_shift_id).to eql shift_id
        expect(response).to have_http_status :ok
      end

    end

  end

end