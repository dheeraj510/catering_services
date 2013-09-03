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

  namespace :users do
    resources :dashboard
  end

  devise_for :businesses ,:controllers=>{:sessions => 'businesses/sessions',
                                    :registrations => 'businesses/registrations'}

  namespace :businesses do
     resources :dashboard do
       get 'add_menu', :on => :collection
       put 'create_menu', :on => :member
       get 'edit_menu', :on => :member
       put 'update_menu', :on => :member
       delete 'delete_menu', :on => :member
     end
   end

  match 'membership', to: 'plans#membership'
  match 'catering-service', to: 'businesses/dashboard#default_catering_service'
  match 'menuprice' => 'businesses/dashboard#menuprice'
  root :to => 'home#index'



end
