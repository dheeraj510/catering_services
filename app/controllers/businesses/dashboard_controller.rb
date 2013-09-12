class Businesses::DashboardController < ApplicationController
  layout 'business'
  def index
    @business = current_business
    @menu = @business.menus
  end

  def edit
    @business = current_business
  end

  def update
    @business = current_business
    respond_to do |format|
      if @business.update_attributes(params[:business])
        format.html { redirect_to(businesses_dashboard_index_path, :notice => 'Details updated successfully.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" , :error => 'Failed to update details.'}
        format.xml  { render :xml => @business.errors, :status => :unprocessable_entity }
      end
    end
  end

  def add_menu
    @business = current_business
    @menu_items = @business.menus
    #  @business.menus.build
  end

  def create_menu
    @business = current_business
    respond_to do |format|
      if @business.update_attributes(params[:business])
        format.html { redirect_to(add_menu_businesses_dashboard_index_path, :notice => 'Details updated successfully.') }
        format.xml  { head :ok }
      else
        format.html {redirect_to :back, :alert => 'Failed to update details.' }

      end
    end
  end

  def edit_menu
    @menu = Menu.find(params[:id])
  end

  def update_menu
    @menu = Menu.find(params[:id])
    if @menu.update_attributes(params[:menu])
      redirect_to(add_menu_businesses_dashboard_index_path, :notice => 'Details updated successfully.')
    else
      #redirect_to :back, :alert => 'Failed to update details.'
      respond_to do |format|
        format.html {render :action => "edit_menu", :controller=>"businesses/dashboard"}
        format.json { render json: @menu.errors }
      end
    end
  end

  def delete_menu
    @menu = Menu.find(params[:id])
    menulist
    if @menu.destroy
      redirect_to(businesses_dashboard_index_path, :notice => 'Item deleted successfully.')
    else
      redirect_to :back, :alert => 'Failed to delete Item.'
    end
  end

  def menuprice
    @totalprice = 0
    if params[:id].blank?
      @totalprice = 0
    else
      params[:id].each do |id|
        @price = Menu.find(id).price
        @totalprice += @price
      end
    end
    if @totalprice
      render :text => @totalprice, :layout => false
    else
      render :text => false, :layout => false
    end
  end


  def default_catering_service
    @menu_list = MenuList.new
    @menu = current_business.menus
  end

  # menulist delete menu method when particular menu is deleted
  def menulist
    @menulist = current_business.menu_lists
    @menulist.each do |m|
      m.menu_ids.split(',').each do |i|
        if i == params[:id]
          @menu_ids = m.menu_ids.split(',')-i.split
          if @menu_ids.count == 0
            m.destroy
          else
            m.update_attribute(:menu_ids, @menu_ids.join(',') )
          end
        end
      end
    end
  end

  def view_orders
    @orders = current_business.order_catalogs.order('created_at desc')
  end

  def view_orders_sort
    puts"################################################3",params[:status]
    status = params[:status]
    case status
      when "all"
        @orders = current_business.order_catalogs.order('created_at desc')
      when "no_price"
        @orders = current_business.order_catalogs.where(:price => nil).order('created_at desc')
      when "price"
        @orders = current_business.order_catalogs.where("price != ?", '').order('updated_at desc')
    end
    respond_to do |f|
      f.js
    end
  end

  def update_order
    @order = OrderCatalog.find(params[:id])
    if @order.update_attribute(:price,params[:price][:price])
      redirect_to :back
    end
  end

end
