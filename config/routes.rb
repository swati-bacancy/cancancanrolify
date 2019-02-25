Rails.application.routes.draw do
  root to: 'manage_users#index'
  devise_for :users
  resources :products
  resources :manage_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
