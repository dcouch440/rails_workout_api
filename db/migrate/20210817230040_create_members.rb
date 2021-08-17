class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.date :signed_up
      t.string :membership
      t.belongs_to :gym, null: false, foreign_key: true

      t.timestamps
    end
  end
end
