Rails.application.routes.draw do
  resources :recipe_items
  resources :pantry_items
  resources :ingredients
  resources :likes
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
