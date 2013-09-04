class HomeController < ApplicationController
  layout 'home'
  def index
    @business = Business.search(params[:search])
  end


end
