Rails.application.routes.draw do
<<<<<<< HEAD
  root 'items#index'
=======
  devise_for :users
  resources :users
>>>>>>> c4b76d0086a588fde0bc875c40eba100dad45c94
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
