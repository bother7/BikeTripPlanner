Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :trips, only: [:index, :create, :destroy]
      resources :stations, only: [:index, :create, :show]
      resources :trains, only: [:index, :create]
      resources :users, only: [:index, :create, :update]
    end
  end
end
