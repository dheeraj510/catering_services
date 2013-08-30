class HomeController < ApplicationController
  layout :change_layout
  def index
  end

  private
  def change_layout
    if user_signed_in?
      "user"
    elsif business_signed_in?
      "business"
    else
      "home"
    end
  end
end
