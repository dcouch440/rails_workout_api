require 'rails_helper'

describe 'DESTROY Member' do

  describe '#destroy', :type => :request do

    let!(:member) { FactoryBot.create(:member) }
    let!(:member_id) { member.id }
    let!(:gym_id) { member.gym_id }

    context 'when successful' do

      it 'it destroys and member' do
        delete v1_gym_member_path(gym_id, member_id)
        expect(response).to have_http_status :no_content
      end

    end

  end

end