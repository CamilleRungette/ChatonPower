Rails.application.routes.draw do
  root 'items#index'

  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :your_cart_better_be_full, controller: :carts do
      resources :orders
    end
  end

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :items


  resources :items do
    post 'search',  :on => :collection
  end

end
