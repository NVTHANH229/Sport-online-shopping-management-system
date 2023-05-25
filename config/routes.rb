require 'sidekiq/web'

Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :products
  resources :brands
  resources :categories
  resources :customers
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users
  root to: 'products#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
