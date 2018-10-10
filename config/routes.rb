
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :books do
    put 'add_to_cart' => 'books#add_to_cart', as: 'add_to_cart'
  end

  resources :home do
    get :best_book, :on => :collection
  end

  resources :authors do
  end

  resources :categories do
  end

  resources :reviews do
  end

  resources :books_orders, :only => [:create, :destroy] do
  end

  resources :coupons

  resources :orders

  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", :as => :login
  end

  resource :cart, only: [:show] do
    put :attach_user
  end
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
