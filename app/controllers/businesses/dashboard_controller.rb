class Businesses::DashboardController < ApplicationController
  layout 'business'
  def index
    @menu = current_business.menus
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
        format.html { render :action => "edit_user" , :error => 'Failed to update details.'}
        format.xml  { render :xml => @business.errors, :status => :unprocessable_entity }
      end
    end
  end

  def add_menu
    @business = current_business
    @business.menus.build
  end

  def create_menu
    @business = current_business
    respond_to do |format|
      if @business.update_attributes(params[:business])
        format.html { redirect_to(businesses_dashboard_index_path, :notice => 'Details updated successfully.') }
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
      redirect_to(businesses_dashboard_index_path, :notice => 'Details updated successfully.')
    else
      redirect_to :back, :alert => 'Failed to update details.'
    end
  end

  def delete_menu
    @menu = Menu.find(params[:id])
    if @menu.destroy
      redirect_to(businesses_dashboard_index_path, :notice => 'Item deleted successfully.')
    else
      redirect_to :back, :alert => 'Failed to delete Item.'
    end
  end

  def menuprice
    @totalprice = 0
    params[:id].each do |id|
      @price = Menu.find(id).price
      @totalprice += @price
    end
    if @totalprice
      render :text => @totalprice, :layout => false
    else
      render :text => false, :layout => false
    end
  end

end
