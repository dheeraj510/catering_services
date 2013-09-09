class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :address, :phone_number, :alternate_number, :booking_id,
                  :state, :country, :zipcode, :city,
                  :provider, :facebook_uid, :linkedin_uid, :twitter_uid
  # attr_accessible :title, :body

  ajaxful_rater

  class << self
    #Omniauth instance methods
    #----------------------------------------------------------------------------------------------------------------------
    #--- Devise with Omniauth follow below -----------------
    # https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
    # for facebook followed https://github.com/mkdynamic/omniauth-facebook

    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"]
        end
      end
    end

    def find_for_facebook_oauth(access_token, signed_in_resource=nil)
      data = access_token.extra.raw_info
      if user = self.find_by_email(data.email)
        user.confirm! unless user.confirmed?
        user
      else # Create a user with a stub password.
        user = User.new(email: data.email,
                        name: data.name,
                        facebook_uid: data.id,
                        phone_number: nil,
                        provider: "facebook")

      end
    end

    def find_for_twitter_oauth(access_token, signed_in_resource=nil)
      data = access_token.extra.raw_info
      puts"#######################################################",data
      if user = self.find_by_email(data.email)
        user.confirm! unless user.confirmed?
        user
      else # Create a user with a stub password.
        user = User.new(email: data.email,
                        name: data.name,
                        twitter_uid: data.id,
                        phone_number: nil,
                        provider: "twitter")

      end
    end

    def find_for_linkedin_oauth(access_token, signed_in_resource=nil)
      data = access_token.extra.raw_info
      if user = self.find_by_email(data.try(:emailAddress))
        user.confirm! unless user.confirmed?
        user
      else # Create a user with a stub password.
        mobile_number = data.try(:phoneNumbers).try(:values)[1][0]["phoneNumber"] rescue nil
        user = User.new(email: data.try(:emailAddress),
                        name:data.try(:firstName) + " "+data.try(:lastName),
                        linkedin_uid: data.try(:id),
                        phone_number: mobile_number,
                        provider: "linkedin")
      end
    end



  end
  #END of Class Methods---------------------------------------------------------------------------------------------------------------------


end

