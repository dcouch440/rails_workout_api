class AddColumnSlugToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :slug, :string
  end
end
