class CreateGyms < ActiveRecord::Migration[6.1]
  def change
    create_table :gyms do |t|
      t.string :name
      t.date :established
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
