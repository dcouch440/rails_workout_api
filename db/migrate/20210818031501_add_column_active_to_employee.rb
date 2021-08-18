class AddColumnActiveToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :employment_active, :boolean
  end
end
