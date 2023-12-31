Rails.application.routes.draw do
  resources :wish_items
  get 'order_items/show'
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index.html.erb"
  root to: 'home#index'
  resources :settings, only: [:index] do
    collection do
      get :password
      patch :update_user
      patch :update_password
    end
  end

  resource :carts, only: [:show]
  # get 'carts/:id' => "carts#show", as: "cart"
  # delete 'carts/:id' => "carts#destroy"
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  resources :orders
  resources :addresses
  resources :claims
  resources :order_items

  namespace :admin do
    root to: 'home#index'
    resources :categories
    resources :products
    resources :orders
    resources :claims
  end
end
