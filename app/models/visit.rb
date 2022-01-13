class Visit < ApplicationRecord

  belongs_to :member

  validates :check_in,
            presence: true

  validates :check_out,
            presence: true,
            on: :update

  def self.add_visitation_status time_update, member_id
    member = Member.find(member_id)
    visit = member.visits.last
    if visit == nil || visit['check_out'] != nil
      created_visit = member.visits.create!({ check_in: time_update })
      [ created_visit, :created]
    else
      visit.update!({ check_out: time_update })
      [ visit, :ok ]
    end
  end

  def self.find_visit_by_member_and_visit_id member_id, id
    Member.find(member_id).visits.find(id)
  end

end
