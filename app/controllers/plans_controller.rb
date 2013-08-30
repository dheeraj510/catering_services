class PlansController < ApplicationController
  layout 'home'
  def membership
    @plan = Plan.all
=begin
    redirect_to business_steps_path
=end
  end
end
