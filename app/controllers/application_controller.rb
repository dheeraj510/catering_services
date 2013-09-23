class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  def city_select
    if cookies[:location].nil?
      redirect_to defaultpage_path
    end
  end
end
