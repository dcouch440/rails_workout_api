require 'rails_helper'

describe 'Update Gym', :type => :request do

  let!(:gym) { FactoryBot.create(:gym) }
  let!(:gym_id) { gym.id }
  let!(:patch_params) {{ name: "Terry's Gym", established: '1111-11-01' }}

  describe '#update' do

    before do
      patch v1_gym_path(gym_id), params: patch_params

      @response = response

      @response_name,
      @response_established,
      @response_id = JSON
                       .parse(response.body)
                       .values_at 'name',
                                  'established',
                                  'id'

    end

    it 'update a gym' do
      expect(@response_name).to eql patch_params[:name]
      expect(@response_established).to eql patch_params[:established]
      expect(@response_id).to eql gym_id
    end

    it 'should return with a 200 response status' do
      expect(@response).to have_http_status :ok
    end

  end

end