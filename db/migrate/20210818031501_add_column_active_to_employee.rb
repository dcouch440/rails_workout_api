class AddColumnActiveToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :active, :boolean
  end
end
