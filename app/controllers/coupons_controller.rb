class CouponsController < InheritedResources::Base
  before_filter :authenticate_business!

  def create

    params[:coupon][:no_of_coupons].to_i.times do
      @coupon = Coupon.new(params[:coupon])
      @coupon.save
    end

    if @coupon.save
      redirect_to :coupons, message: "coupons add successful"
    end

  end
end
