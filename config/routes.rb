Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars

  get '/cars/users/:user_id', to: 'cars#mine', as: :cars_mine

  resources :bookings, only: [:new, :create, :destroy]
  patch '/bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  patch '/bookings/:id/decline', to: 'bookings#decline', as: :decline_booking
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
