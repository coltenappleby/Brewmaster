Rails.application.routes.draw do
  resources :like_tables
  resources :beer_menus
  resources :reviews
  resources :bars
  resources :breweries
  resources :beers
  resources :users

  get '/login', to: 'sessions#new_login', as: "new_login"
  post '/login', to: 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
