Rails.application.routes.draw do
  resources :product_areas
  devise_for :users
  resources :clients
  resources :feature_requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/feature_requests')
end
