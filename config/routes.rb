Rails.application.routes.draw do
  resources :cuisine_pairings
  resources :wines
  resources :dishes
  resources :cuisines
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
