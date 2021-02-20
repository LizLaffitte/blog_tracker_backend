Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  post "/signup", to: "api/v1/users#create"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :update, :destroy] do
        resources :clients, only: [:create, :show, :index, :update, :destroy]
      end
      resources :blogs, only: [:index]
    end
  end
end
