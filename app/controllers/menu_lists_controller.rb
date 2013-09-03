class MenuListsController < ApplicationController

  def index
    @menu_ids = params[:id]
    if @menu_ids
      render :text => @menu_ids, :layout => false
    else
      render :text => false, :layout => false
    end
  end

  def create
    @menu_id = []
    params[:id].each do |i|
      @menu_id.push(i)
    end
 @sample = @menu_id.join(',')
    @name = params[:name]
    @menu_list = MenuList.create(:name => @name,
                                 :menu_ids => @sample,
                                 :business_id => current_business.id )
   respond_to do |format|
      format.js
   end
  end
end