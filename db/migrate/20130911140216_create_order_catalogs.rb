class CreateOrderCatalogs < ActiveRecord::Migration
  def change
    create_table :order_catalogs do |t|
      t.integer :user_id
      t.integer :business_id
      t.integer :menulist_id
      t.text :menu_ids
      t.float :price
      t.text :message


      t.timestamps
    end
  end
end
