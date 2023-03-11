Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/my_listings", to: "pages#my_listings", as: "my_listings"
  get "/my_offers", to: "pages#my_offers", as: "my_offers"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # nested resources to allow user to create review to the listing

  resources :listings do
    resources :reviews, only: %i[new create index]
    resources :offers, only: [:create] # Allows creating a offer straight from listing
  end

  resources :reviews, only: %i[destroy]

  resources :offers, only: [:index, :show, :new, :update, :destroy] do
    member do
      put :accept_offer
    end
  end
end
