Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :footprints, only: [:create]
      post '/login', to: 'auth#create'
    end
  end
end
