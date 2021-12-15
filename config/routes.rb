Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars
  get '/cars/category/:category', to: 'cars#category', as: :car_category
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
