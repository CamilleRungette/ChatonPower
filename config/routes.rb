Rails.application.routes.draw do
  get 'admins/index'
  get 'admins/new'
  get 'admins/create'
  get 'admins/show'
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


   # For the controller to be found, first declare the admins controller before namespace declaration
  resources :admins

  # Admin dashboard
  scope :admin do
    root to: "admins#index"
    resources :users
    resources :items
  end



  resources :items do
    resources :favorites
  end

  resources :users do
    resources :favorites
  end

end
