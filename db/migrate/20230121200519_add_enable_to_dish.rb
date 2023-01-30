class AddEnableToDish < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :enabled, :boolean
  end
end
