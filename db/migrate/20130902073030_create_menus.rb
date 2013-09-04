class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :item_type
      t.string :description
      t.integer :price
      t.integer :business_id

      t.timestamps
    end
  end
end
