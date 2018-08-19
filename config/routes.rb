
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :books do
  end

  resources :authors do
  end

  resources :categories do
  end

  resources :reviews do
  end

  resources :books_orders do
  end

  resource :cart, only: [:show]

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
