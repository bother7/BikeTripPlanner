Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :trips, only: [:index, :create, :destroy]
      resources :stations, only: [:index, :create]
      resources :trains, only: [:index, :create]
    end
  end
end
