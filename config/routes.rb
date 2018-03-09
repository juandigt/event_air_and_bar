Rails.application.routes.draw do
  devise_for :users

  resources :spaces do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]

  root to: 'pages#home'

  get "/dashboard", to: "dashboard#index"
end
