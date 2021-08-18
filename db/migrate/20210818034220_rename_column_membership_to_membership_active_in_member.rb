class RenameColumnMembershipToMembershipActiveInMember < ActiveRecord::Migration[6.1]
  def change
    rename_column :members, :membership, :membership_active
  end
end
