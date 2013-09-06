class Coupon < ActiveRecord::Base
  attr_accessible :business_id, :coupon,
                  :coupon_name, :coupon_status,
                  :discount, :no_of_coupons
  attr_accessor :no_of_coupons

  belongs_to :business

  before_save :update_coupon

  def update_coupon
    self.coupon = SecureRandom.hex(8)
  end

end
