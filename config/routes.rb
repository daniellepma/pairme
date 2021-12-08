Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "cuisines#index"
  resources :saved_pairings
  resources :dish_pairings
  resources :cuisine_pairings
  resources :wines
  resources :dishes
  resources :cuisines
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
