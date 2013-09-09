class BusinessesController < ApplicationController
  def rate
      @business = Business.find(params[:id])
      @business.rate(params[:stars], current_user, params[:dimension])
      render :update do |page|
        page.replace_html @business.wrapper_dom_id(params), ratings_for(@business, params.merge(:wrap => false))
        page.visual_effect :highlight, @business.wrapper_dom_id(params)
      end
    end
end