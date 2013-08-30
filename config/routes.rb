CateringServices::Application.routes.draw do


  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config


  devise_for :users,:controllers=>{:sessions => 'users/sessions',
                                   :registrations => 'users/registrations',
                                   :passwords => 'users/passwords',
                                   :omniauth_callbacks => "users/omniauth_callbacks" } ,
             path_names: {sign_in: "login", sign_out: "logout"}
  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
    post 'users/auth/register'=>'users/omniauth_callbacks#create'

  end

  devise_for :businesses ,:controllers=>{:sessions => 'businesses/sessions',
                                    :registrations => 'businesses/registrations'}

  root :to => 'home#index'

end
