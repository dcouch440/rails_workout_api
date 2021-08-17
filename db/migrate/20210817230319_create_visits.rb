class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.belongs_to :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
