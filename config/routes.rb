Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  localized do

    root 'home#index'
    post '/listings/contact', to: 'listings#contact', as: 'listing_contact'
    devise_for :users
    resources :listings, only: [:index, :show, :new, :create]

    namespace :account do
      root 'messages#index'
      resources :messages, only: [:index, :update]

      resources :contacts

      resources :users
      resources :comments
    end
  end

end
