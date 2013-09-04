class HomeController < ApplicationController
  layout 'home'
  def index
    if params[:search]
    @all_business = Business.search(params[:search])
      end
  end


end
