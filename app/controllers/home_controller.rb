class HomeController < ApplicationController
  layout 'home'
  def index
    if params[:search]
    @all_business = Business.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
      end
  end


end
