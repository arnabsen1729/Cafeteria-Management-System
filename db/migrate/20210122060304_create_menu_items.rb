class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.bigint :menu_id
      t.string :name
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
