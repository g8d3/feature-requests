Rails.application.routes.draw do
  resources :clients
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :feature_requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/admin')
end
