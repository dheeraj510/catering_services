class Business < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :address, :phone_number, :alternate_number,
                  :state, :country, :zipcode, :city, :plan_id, :menus_attributes
  # attr_accessible :title, :body
  validates :name, presence: {message: "Name should be present"}
  validates :phone_number, presence: true
  validates :plan_id, presence: true


  has_one :plan
  has_many :menus, :dependent => :destroy
  accepts_nested_attributes_for :menus,
                                allow_destroy: true
  has_many :menu_lists
end
