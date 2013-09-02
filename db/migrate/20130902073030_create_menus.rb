class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :type
      t.string :description
      t.string :price
      t.string :business_id

      t.timestamps
    end
  end
end
