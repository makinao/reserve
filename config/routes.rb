Rails.application.routes.draw do
  root 'rooms#top'
  devise_for :users
  namespace :users do
    resources :profiles, only: [:edit, :update, :index]
    get 'accounts/index'
   end
  get 'users/index'
  get 'rooms/index'
  get 'rooms/search'
  get 'reservations/confirm'
  get 'reservations/index'
  post '/rooms/:room_id/reservations/confirm' => 'reservations#create'
  resources :rooms
  resources :reservations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end