Rails.application.routes.draw do
  resources :animals, only: [:index, :show]
  resources :reports, only: [:index, :show, :create]
  resources :locations, only: [:index, :show]
end
