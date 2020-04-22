Rails.application.routes.draw do
  resources :stations
  resources :rooms
  root 'rooms#index'
end
