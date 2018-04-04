Rails.application.routes.draw do

  resources :carts
  resources :orders
  resources :items
  root to: "pages#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, :only => [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
