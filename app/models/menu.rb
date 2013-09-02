class Menu < ActiveRecord::Base
  attr_accessible :business_id, :description, :name, :price, :item_type
  validates :name,
               :presence => true
  belongs_to :business
end
