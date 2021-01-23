class AddIsActiveToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :is_active, :bool
  end
end
