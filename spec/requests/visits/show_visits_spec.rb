require 'rails_helper'

describe 'SHOW Visit' do

  describe '#show', :type => :request do

    let!(:visit) { FactoryBot.create(:visit) }
    let!(:member_id) { visit.member_id }
    let!(:visit_id) { visit.id }

    context 'when successful' do

      it 'shows a visit' do
        get v1_member_visit_path(member_id, visit_id)
        res = JSON.parse(response.body)

        response_member_id = res['member_id']
        response_visit_id = res['id']

        expect(response_member_id).to eql member_id
        expect(response_visit_id).to eql visit_id
        expect(response).to have_http_status :ok
      end

    end

  end

end