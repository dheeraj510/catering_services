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

end
