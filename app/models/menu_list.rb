class MenuList < ActiveRecord::Base
  attr_accessible :business_id, :menu_ids, :name
  belongs_to :business
end
