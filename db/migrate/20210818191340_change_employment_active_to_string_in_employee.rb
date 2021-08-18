class ChangeEmploymentActiveToStringInEmployee < ActiveRecord::Migration[6.1]
  def change
    change_column :employees, :employment_active, :string
  end
end
