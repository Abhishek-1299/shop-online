Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  namespace :api do
    namespace :v1 do
      # get 'products/index'
      # get 'products/create'
      
       resources :products
       # only: [:show, :create, :index]
      # get 'products/show'
      get 'carts/index'
      get 'carts/show'
      get 'carts/create'
      get 'carts/address', to: 'carts#address'
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  get 'home/users'
  get 'home/about'
  # resources :users;
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  # resources :order_items do
  #   member do
  #     post 'add_to_cart' 
  #   end
  # end
  
  get '/products', to: 'home#index'

  get '/order_items/:product_id/add_to_cart', to: 'order_items#add_to_cart', as: :add_to_cart
  delete '/order_items/:id', to: 'order_items#destroy', as: :remove_order_item

  
  #resources :carts
  #get "/carts" , to: "carts#show"
  resources :carts, only: :index
  get '/cart', to: 'carts#cart', as: :cart
  get '/carts/address', to: 'carts#address'
  post 'carts/address_create', to: 'carts#address_create'
  put '/assign_address', to: 'carts#assign_address'
  get '/carts/payment', to: 'carts#payment'
  post 'carts/payment_success', to: 'carts#payment_success'
  get '/carts/complete', to: 'carts#complete'
end
