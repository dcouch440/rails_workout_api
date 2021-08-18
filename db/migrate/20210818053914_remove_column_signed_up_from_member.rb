class RemoveColumnSignedUpFromMember < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :signed_up
  end
end
