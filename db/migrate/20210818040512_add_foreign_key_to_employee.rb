class AddForeignKeyToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :location, null: false, foreign_key: true
  end
end
