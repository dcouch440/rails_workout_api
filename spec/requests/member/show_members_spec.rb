require 'rails_helper'

describe 'SHOW member', :type => :request do
  let!(:members) { FactoryBot.create_list(:member, 10) }
  let!(:first_member_id) { members.first.id }
  let!(:last_member_id) { members.last.id }

  describe '#member' do

    context 'when successful' do

      it 'returns the first indexed member' do
        get member_path(first_member_id)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['id']).to eql first_member_id
        expect(response).to have_http_status :ok
      end

      it 'returns the last indexed member' do
        get member_path(last_member_id)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['id']).to eql last_member_id
        expect(response).to have_http_status :ok
      end

    end

    context 'when unsuccessful' do

      it 'returns the an error code of 404' do
        get member_path(last_member_id + 1)
        expect(response).to have_http_status :not_found
      end

    end

  end

end