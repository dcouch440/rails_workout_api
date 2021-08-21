require 'rails_helper'

describe 'CREATE Visit' do

  describe '#status check_in', :type => :request do

    let(:member) { FactoryBot.create(:member) }
    let!(:member_id) { member.id }
    let(:time) { '1111-11-01T08:00:00.000Z' }

    context 'when successful' do

      it 'lets a user check in' do
        post v1_member_visits_path member_id, params: { time: time }
        res = JSON.parse(response.body)
        expect(res['check_in']).to eql time
        expect(response).to have_http_status :created
      end

    end

    context 'when unsuccessful' do

      it 'throws an error' do
        post v1_member_visits_path member_id, params: { time: nil }
        expect(response).to have_http_status :unprocessable_entity
      end

    end

  end

  describe '#status - check_out', :type => :request do

  let!(:visit) { FactoryBot.create(:visit) }
  let!(:member_id) { visit.member_id }
  let(:time) { '1111-11-01T08:00:00.000Z' }

  context 'when successful' do

    it 'lets a member check in' do
      post v1_member_visits_path member_id, params: { time: time }
      res = JSON.parse(response.body)
      expect(res['check_out']).to eql time
      expect(response).to have_http_status :ok
    end

  end

  context 'when unsuccessful' do

    it 'throws an error' do
      post v1_member_visits_path member_id, params: { time: nil }
      expect(response).to have_http_status :unprocessable_entity
    end

  end

end

end