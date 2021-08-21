require 'rails_helper'

describe 'UPDATE Shift' do

  describe '#update', :type => :request do

    let(:employee) { FactoryBot.create(:employee) }
    let(:employee_id) { employee.id }
    let(:time) { '1111-11-01T08:00:00.000Z' }
    let!(:shift) { employee.shifts.create!({ check_in: time }) }
    let!(:shift_id) { shift.id }
    let!(:updated_time) { '1111-11-01T08:01:00.000Z' }

    context 'when successful' do

      it 'updates a shift' do
        patch v1_employee_shift_path(employee_id, shift_id), params: {
          check_in: updated_time,
          check_out: updated_time
        }
        res = JSON.parse(response.body)
        check_in = res['check_in']
        check_out = res['check_out']

        expect(check_in).to eql updated_time
        expect(check_out).to eql updated_time
        expect(response).to have_http_status :ok
      end

    end

    context 'when unsuccessful' do

      it 'rejects the request' do
        patch v1_employee_shift_path(employee_id, shift_id), params: {
          check_in: '',
          check_out: ''
        }
      end

    end

  end

end