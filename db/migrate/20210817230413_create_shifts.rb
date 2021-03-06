class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.belongs_to :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
