Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/login' to: 'auth#create'
      post '/me' to: 'auth#show'
    end
  end
end
