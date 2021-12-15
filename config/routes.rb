Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :offers, except: [:edit] do
    resources :reservations, only: [:new, :create]
    collection do
      get :dashboard
    end
  end
  resources :reservations, only: [:show, :destroy] do
    # new route to change the status of the reservation
    get :accept_status
  end
  # don't forget to except "edit and destroy" to nest with users routes
end
