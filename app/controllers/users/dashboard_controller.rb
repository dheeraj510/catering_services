class Users::DashboardController < ApplicationController
  layout :choose
  def index
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_dashboard_index_path, :notice => 'Details updated successfully.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit_user" , :error => 'Failed to update details.'}
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def view_business
    @business = Business.find(params[:id])
  end

  def choose
    if user_signed_in?
      'user'
    else
      'home'
    end
  end

end
