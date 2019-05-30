Rails.application.routes.draw do
  root 'items#index'

  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :carts do
      resources :orders
    end
  end

  resources :users do
    resources :carts
  end

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :items
  resources :charges

  resources :items do
    post 'search',  :on => :collection
  end

end
