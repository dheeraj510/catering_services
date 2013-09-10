CateringServices::Application.routes.draw do


  resources :search_suggestions


  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config


  devise_for :users,:controllers=>{:sessions => 'users/sessions',
                                   :registrations => 'users/registrations',
                                   :omniauth_callbacks => "users/omniauth_callbacks" } ,
             path_names: {sign_in: "login", sign_out: "logout"}
  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
    post 'users/auth/register'=>'users/omniauth_callbacks#create'

  end

  namespace :users do
    resources :dashboard

  end
  match "business/:id", to: 'users/dashboard#view_business', :as => 'business_view'

  devise_for :businesses ,:controllers=>{:sessions => 'businesses/sessions',
                                    :registrations => 'businesses/registrations'}

  namespace :businesses do
     resources :dashboard do
       get 'add_menu', :on => :collection
       put 'create_menu', :on => :member
       get 'edit_menu', :on => :member
       put 'update_menu', :on => :member
       delete 'delete_menu', :on => :member
       get 'default_catering_service', :on => :collection
     end
   end

  match 'membership', to: 'plans#membership'
  match 'menuprice' => 'businesses/dashboard#menuprice'

  root :to => 'home#index'

  resources :menu_lists , :only => [:index, :edit]
  match 'menuids' => 'menu_lists#create'
  match 'menulistUpdate' => 'menu_lists#update'

  resources :businesses, :only => [] do
    post 'rate', :on => :member
  end

end
