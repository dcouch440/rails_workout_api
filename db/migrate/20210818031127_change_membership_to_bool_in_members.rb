class ChangeMembershipToBoolInMembers < ActiveRecord::Migration[6.1]
  def change
    change_column :members, :membership, 'boolean USING CAST(membership AS boolean)'
  end
end
