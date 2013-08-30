class PlansController < ApplicationController
  layout 'business'
  def membership
    @plan = Plan.all
=begin
    redirect_to business_steps_path
=end
  end
end
