class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :coupon_name
      t.integer :discount
      t.string :coupon
      t.boolean :coupon_status , default: false
      t.integer :business_id

      t.timestamps
    end
  end
end
