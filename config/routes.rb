Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :fractions
  namespace :api do
    namespace :v1 do
      resources :products do
        #get "/packaging", to: 'packages#addPackaging'
        post "/packaging", to: 'packages#addPackaging'
      end
      resources :categories
      resources :unities

      resources :providers
      resources :people
      resources :contacts
      resources :phones
      
      post "/token", to: 'users#getToken'
      get "/decodedToken", to: 'users#decodedToken'
    end
  end
end
