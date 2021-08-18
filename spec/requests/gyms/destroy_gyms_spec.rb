require 'rails_helper'

describe 'DELETE Gym' do

  describe '#destroy', :type => :request do

    let!(:gym) { FactoryBot.create(:gym) }
    let!(:gym_id) { gym.id }

    context 'when successful' do

      it 'deletes a gym' do
        delete gym_path(gym_id)
        expect(response).to have_http_status :no_content
      end

    end

    context 'when unsuccessful' do

      it 'returns the an error code of 404' do
        delete gym_path(gym_id + 1)
        expect(response).to have_http_status :not_found
      end

    end

  end

end