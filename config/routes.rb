Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :offers, except: [:edit, :destroy, :dashboard] do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:show, :destroy]

  #don't forget to except "edit and destroy" to nest with users routes
end
