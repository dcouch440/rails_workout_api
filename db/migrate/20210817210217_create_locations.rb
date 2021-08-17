class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :street_address
      t.string :state_province
      t.string :city
      t.integer :postal_code

      t.timestamps
    end
  end
end
