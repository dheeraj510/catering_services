class MenuListsController < ApplicationController
  layout 'business'
  def index

    @lists = MenuList.where(:business_id => current_business)
=begin
    @menu_ids = params[:id]
    if @menu_ids
      render :text => @menu_ids, :layout => false
    else
      render :text => false, :layout => false
    end
=end
  end

  def create
    if params[:name].blank? || params[:id].blank? || params[:price].blank
      @text = "List name can't be blank and select atleast one item."
      @message = "fail"
    else
      @menu_id = []
      params[:id].each do |i|
        @menu_id.push(i)
      end
      @sample = @menu_id.join(',')
      @name = params[:name]
      @price = params[:price]
      @menu_list = MenuList.create(:name => @name,
                                   :menu_ids => @sample,
                                   :business_id => current_business.id,
                                   :price => @price )
      @text = "Menu list created successfully."
    end
    respond_to do |format|
      format.js
    end
  end

  def edit
    @menu_list = MenuList.find(params[:id])
    @menu = current_business.menus
    @menus = @menu_list.menu_ids.split(",")
  end

  def update
     if params[:name].blank? || params[:id].blank?  || params[:price].blank?
       @text = "List name can't be blank and select atleast one item."
       @message = "fail"
     else
       @menu_id = []
       params[:id].each do |i|
         @menu_id.push(i)
       end
       @list = MenuList.find(params[:menulistid])
       @sample = @menu_id.join(',')
       @name = params[:name]
       @price = params[:price]
       @menu_list = @list.update_attributes(:name => @name,
                                    :menu_ids => @sample,:price => @price
                                     )
       @text = "Menu list created successfully."
     end
     respond_to do |format|
       format.js
     end
   end

end