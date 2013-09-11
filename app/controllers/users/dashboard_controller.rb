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
    @business = Business.find_by_name(params[:id])
    @menu_items = @business.menus.paginate(:page => params[:page], :per_page => 5).order('created_at ASC')

  end

  def new_order_catalog
    @order_catalog = OrderCatalog.new
    @menu_list = MenuList.find(params[:id])
    @menu = @menu_list.business.menus
    @menus = @menu_list.menu_ids.split(",")
  end

  def create_order_catalog
    if params[:message].blank? || params[:business_id].blank?
          @text = "List name can't be blank and select atleast one item."
          @message = "fail"
        else
          @menu_id = []
          params[:id].each do |i|
            @menu_id.push(i)
          end
          @sample = @menu_id.join(',')
          @business_id = params[:business_id]
          @menulist_id = params[:menulist_id]
          @message = params[:message]
          @menu_list = OrderCatalog.create(:user_id => current_user.id,
                                           :business_id => @business_id,
                                           :menulist_id => @menulist_id,
                                       :menu_ids => @sample,
                                       :message => @message )
          @text = "Catalog Sent successfully."
        end
        respond_to do |format|
          format.js
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

  def choose
    if user_signed_in?
      'user'
    else
      'home'
    end
  end

end
