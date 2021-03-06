require 'rails_helper'

describe 'GET Gym', :type => :request do

  let!(:gym) { FactoryBot.create(:gym) }

  describe '#index' do

    before do

      get v1_gyms_path

      @response = response

      @response_name,
      @response_established,
      @response_location_id = JSON
                                .parse(response.body)
                                .first()
                                .values_at 'name',
                                           'established',
                                           'location_id'

      @gym_established_string = gym.established.to_s()
      @gym_location_id = gym.location.id
      @gym_name = gym.name

    end

    it 'should return a gym' do
      expect(@response_name).to eql @gym_name
      expect(@response_established).to eql @gym_established_string
      expect(@response_location_id).to eql @gym_location_id
    end

    it 'should return with a 200 response status' do
      expect(@response).to have_http_status :ok
    end

  end

end