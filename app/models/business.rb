class Business < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :address, :phone_number, :alternate_number,
                  :state, :country, :zipcode, :city, :plan_id, :menus_attributes,
                  :avatar
  # attr_accessible :title, :body
  validates :name, presence: {message: "Name should be present"}
  validates :phone_number, presence: true
  validates :plan_id, presence: true
  validates :email, uniqueness: true


  has_one :plan
  has_many :menus, :dependent => :destroy
  accepts_nested_attributes_for :menus,
                                allow_destroy: true
  has_many :menu_lists

  has_attached_file :avatar,
                    :styles => { :medium => "300x300>",
                                 :square => "200x200>",
                                 :thumb => "100x100>" },
                    :default_url => "/assets/:style/no_image_found.jpg"

  validates_attachment :avatar,
      :content_type => { :content_type => ["image/jpg","image/png","image/jpeg", "image/gif"],
                         :message => "Invalid format. Should be .jpg / .png / .gif" },
      :size => { :in => 0..1.megabytes }
  ajaxful_rateable :stars => 10, :dimensions => [:taste, :response, :hospitality]

  has_many :order_catalogs


end
