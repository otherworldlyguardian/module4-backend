Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :cities, only: [:index, :show]
      post '/login', to: 'auth#create'
      get '/me', to: 'auth#show'
      resources :users, only: [:create]
    end
  end
end
