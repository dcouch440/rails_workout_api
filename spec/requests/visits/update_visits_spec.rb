require 'rails_helper'

describe 'UPDATE Shift' do

  describe '#update', :type => :request do

    let!(:member) { FactoryBot.create(:member) }
    let!(:member_id) { member.id }
    let!(:time) { '1111-11-01T08:00:00.000Z' }
    let!(:visit) { member.visits.create!({ check_in: time }) }
    let!(:visit_id) { visit.id }
    let!(:updated_time) { '1111-11-01T08:01:00.000Z' }

    context 'when successful' do

      it 'updates a visit' do
        patch v1_member_visit_path(member_id, visit_id), params: {
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
        patch v1_member_visit_path(member_id, visit_id), params: {
          check_in: '',
          check_out: ''
        }
      end

    end

  end

end