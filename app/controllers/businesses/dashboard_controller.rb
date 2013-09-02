class Businesses::DashboardController < ApplicationController
  layout 'business'
  def index
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

end
