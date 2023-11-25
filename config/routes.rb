Rails.application.routes.draw do
  devise_for :users
  namespace :users do
    resources :profiles, only: [:edit, :update, :index]
    get 'accounts/index'
   end
  resources :users
  resources :rooms
  get 'users/index'
  get 'rooms/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
