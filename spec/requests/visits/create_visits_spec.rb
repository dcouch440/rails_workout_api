require 'rails_helper'

describe 'CREATE Visit' do

  describe '#create', :type => :request do

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

end