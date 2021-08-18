require 'rails_helper'

describe 'SHOW Gym', :type => :request do
  let!(:gyms) { FactoryBot.create_list(:gym, 10) }
  let!(:first_gym_id) { gyms.first.id }
  let!(:last_gym_id) { gyms.last.id }

  describe '#gym' do

    context 'when successful' do

      it 'returns the first indexed gym' do
        get v1_gym_path(first_gym_id)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['id']).to eql first_gym_id
        expect(response).to have_http_status :ok
      end

      it 'returns the last indexed gym' do
        get v1_gym_path(last_gym_id)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['id']).to eql last_gym_id
        expect(response).to have_http_status :ok
      end

    end

    context 'when unsuccessful' do

      it 'returns the an error code of 404' do
        get v1_gym_path(last_gym_id + 1)
        expect(response).to have_http_status :not_found
      end

    end

  end

end