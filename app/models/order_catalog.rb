class OrderCatalog < ActiveRecord::Base
  attr_accessible :business_id, :menu_ids,
                  :menulist_id, :message,
                  :price, :user_id

  belongs_to :user
  belongs_to :business
  belongs_to :menu_list
end
