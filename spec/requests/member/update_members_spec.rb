require 'rails_helper'

describe 'Update Member', :type => :request do

  let!(:member) { FactoryBot.create(:member) }
  let!(:member_id) { member.id }
  let!(:gym_id)  { member.gym_id }
  let!(:successful_patch_params) {{ name: "Terry", membership_active: 'inactive' }}
  let!(:unsuccessful_patch_params) {{ name: "Terry", membership_active: 'not active' }}

  describe '#update' do

    context 'when successful' do

      it 'update a member' do

        patch "/v1/gyms/#{gym_id}/members/#{member_id}", params: successful_patch_params

        @response_name,
        @response_membership_active,
        @response_id = JSON
                         .parse(response.body)
                         .values_at 'name',
                                    'membership_active',
                                    'id'

        expect(@response_name).to eql successful_patch_params[:name]
        expect(@response_membership_active).to eql successful_patch_params[:membership_active]
        expect(@response_id).to eql member_id
        expect(response).to have_http_status :ok

      end

    end

    context 'when unsuccessful' do

      it 'returns a status code of 422' do
        patch "/v1/gyms/#{gym_id}/members/#{member_id}", params: unsuccessful_patch_params
        expect(response).to have_http_status 422
      end

    end

  end

end