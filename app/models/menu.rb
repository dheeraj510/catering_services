class Menu < ActiveRecord::Base
  attr_accessible :business_id, :description, :name, :price, :type

  belongs_to :business
end
