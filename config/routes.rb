Rails.application.routes.draw do  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :fractions
  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
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
      
      resources :warehouses
      resources :atp_stocks
      resources :atp_imposts
      
      resources :purchases
      resources :receipts
      resources :charges
      resources :vouchers


      resources :plannings
      resources :proof_sales
      resources :promotion_has_products
      resources :sales
      resources :birthdays
      resources :customers
      resources :promotions
      resources :calendars

      resources :chances
      
      
      resources :products_has_chances
      
      
      post "/token", to: 'users#getToken'
      get "/decodedToken", to: 'users#decodedToken'
    end
  end
end
