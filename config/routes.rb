Rails.application.routes.draw do
  resources :beer_menus
  resources :reviews
  resources :bars
  resources :breweries
  resources :beers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
