Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars
  get '/cars/category/:category', to: 'cars#category', as: :car_category
  resources :bookings, only: [:new, :create, :destroy]
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  patch '/bookings/:id', to: 'bookings#accept', as: :accept_booking
  patch '/bookings/:id', to: 'bookings#decline', as: :decline_booking
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
