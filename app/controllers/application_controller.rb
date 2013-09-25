class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :city_select
  private

  def city_select
    if cookies[:location].nil?
      redirect_to defaultpage_path
    else
      @location = cookies[:location]
    end
  end

end
