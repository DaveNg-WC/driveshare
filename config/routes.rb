Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # nested resources to allow user to create review to the listing

  resources :listings do
    resources :reviews, only: %i[new create index]
  end

  resources :reviews, only: %i[destroy]
  
  resources :offers, only: [:index, :show, :new, :create, :update, :destroy] do
    member do
      put :accept_offer
    end
  end

end
