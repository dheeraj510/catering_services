class MenuList < ActiveRecord::Base
  attr_accessible :business_id, :menu_ids, :name, :price
  belongs_to :business
  has_many :order_catalogs
end
