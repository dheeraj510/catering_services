class Menu < ActiveRecord::Base
  attr_accessible :business_id, :description,
                  :name, :price, :item_type, :image
  validates :name,
            :presence => true
  belongs_to :business

  has_attached_file :image,
                    :styles => { :medium => "300x300>",
                                 :square => "200x200>",
                                 :thumb => "100x100>",
                                 :small => "50x50>" },
                    :default_url => "/assets/:style/no_image_found.jpg"

  validates_attachment :image,
                       :content_type => { :content_type => ["image/jpg","image/png","image/jpeg", "image/gif"],
                                          :message => "Invalid format. Should be .jpg / .png / .gif" },
                       :size => { :in => 0..1.megabytes,
                       :message => "Image should < 1 MB"}
end
