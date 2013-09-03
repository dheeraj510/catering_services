class CreateMenuLists < ActiveRecord::Migration
  def change
    create_table :menu_lists do |t|
      t.string :name
      t.text :menu_ids
      t.integer :business_id

      t.timestamps
    end
  end
end
