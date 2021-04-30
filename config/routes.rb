Rails.application.routes.draw do
  resources :recipe_items
  resources :pantry_items
  resources :ingredients
  resources :likes
  resources :recipes
  resources :users
  post '/signin', to: 'auth#create'
  get '/persist', to: 'auth#show'
end
