class HomeController < ApplicationController
  layout 'home'
  before_filter :city_select, :only => [:index]
  def index
    @location = cookies[:location]
    if params[:search]
      @all_business = Business.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
    end
  end

  def set_cookie
    @location = params[:city][:city]
    cookies[:location]   = @location
    redirect_to :back
  end


  def default_page
    if cookies[:location]
      redirect_to root_path
    end
  end


end
