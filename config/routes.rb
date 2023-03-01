Rails.application.routes.draw do
  # ROUTES FOR LISTINGS
  get "/listings", to: "listings#index", as: "listings"
  get "/listings/new", to: "listings#new", as: "new_listing"
  post "/listings", to: "listings#create"
  get "/listings/:id", to: "listings#show", as: "listing"
  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"
  patch "/listings/:id", to: "listings#update"
  put "/listings/:id", to: "listings#update"
  delete "/listings/:id", to: "listings#destroy"
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :listings do
    resources :reviews, only: %i[new create]
  end

  resources :offers, only: %i[index show create update destroy]
end
