class ChangeMembershipToStringInMember < ActiveRecord::Migration[6.1]
  def change
    change_column :members, :membership_active, :string
  end
end
