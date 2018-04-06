Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :carts
  resources :orders
  resources :items
  resources :users, :only => [:show]
  resources :users

  root to: "pages#index"
  get '/admin_show', to: 'items#admin_show'
  get '/index', to: 'users#index'
  get '/user_cart', to: 'users#user_cart'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
