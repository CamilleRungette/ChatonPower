Rails.application.routes.draw do
  root 'items#index'

  resources :items do
  	 resources :avatars, only: [:create]
  	end

  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
