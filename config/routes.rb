Rails.application.routes.draw do
  root 'items#index'

  devise_for :users

  resources :users do
    resources :your_cart_better_be_full, controller: :carts do
      resources :orders
    end
  end

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :items do
    post 'search',  :on => :collection
  end

  resources :items do
    resources :favorites
  end

  resources :users do
    resources :favorites
  end
end
