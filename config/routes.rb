Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  localized do

    root 'home#index'
    resources :listings
    
  end

end
