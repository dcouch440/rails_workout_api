require 'rails_helper'

describe 'GET Shift' do

  let!(:visit) { FactoryBot.create_list(:visit, 5) }
  let(:first_member) { visit.first.member_id }

  describe '#index', :type => :request do

    before do
      get v1_member_visits_path(first_member)
      @response = JSON.parse(response.body)
    end

    it 'should return a member' do
      expect(@response).to be_kind_of Array
    end

  end

end