require 'rails_helper'

describe 'UPDATE Shift' do

  describe '#status', :type => :request do

    let(:employee) { FactoryBot.create(:employee) }
    let(:employee_id) { employee.id }
    let(:time) { '1111-11-01T08:00:00.000Z' }
    let!(:shift) { employee.shifts.create!({ check_in: time }) }

    context 'when successful' do

      before do

      end

      it 'lets a employee check in' do
        post v1_employee_shifts_path employee_id, params: {
          time: time
        }
        res = JSON.parse(response.body)
        expect(res['check_out']).to eql time
        expect(response).to have_http_status :ok
      end

    end

    context 'when unsuccessful' do

      it 'throws an error' do
        post v1_employee_shifts_path employee_id, params: {
          time: nil
        }
        expect(response).to have_http_status :unprocessable_entity
      end

    end

  end

end