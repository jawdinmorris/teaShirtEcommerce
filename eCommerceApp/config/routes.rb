Rails.application.routes.draw do

  resources :carts
  resources :orders
  resources :items
    resources :users
  root to: "pages#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, :only => [:show]
  get '/admin_show', to: 'items#admin_show'
  get '/index', to: 'users#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
