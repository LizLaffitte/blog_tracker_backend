Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
 
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :update, :destroy] do
        resources :clients, only: [:create, :show, :index, :update, :destroy]
      end
      resources :blogs, only: [:index]
      post "/auth", to: "user_token#create"
    end
  end
end
