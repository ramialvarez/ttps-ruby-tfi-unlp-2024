Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }


  root "storefront#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, except: [:new, :create]

  resources :products
  
  resources :sales 
  
  resources :users do
    member do
      patch :activate
      patch :deactivate
    end
  end

end
