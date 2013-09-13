class HomeController < ApplicationController
  layout 'home'
  def index

    @location = cookies[:location]
    if params[:search]
    @all_business = Business.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
      end
  end

  def set_cookie
    @location = params[:city]
    cookies[:location]   = @location
    redirect_to :back
  end


end
