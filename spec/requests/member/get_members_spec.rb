require 'rails_helper'

describe 'GET member', :type => :request do

  let!(:member) { FactoryBot.create(:member) }
  let!(:membership_active) { member.membership_active }
  let!(:location_id) { member.location_id }
  let!(:member_name) { member.name }

  describe '#index' do

    before do
      get v1_members_path

      @response_name,
      @response_membership_active,
      @response_location_id = JSON
                                .parse(response.body)
                                .first()
                                .values_at 'name',
                                           'membership_active',
                                           'location_id'

    end

    it 'should return a member' do
      expect(@response_name).to eql member_name
      expect(@response_membership_active).to eql membership_active
      expect(@response_location_id).to eql location_id
    end

  end

end