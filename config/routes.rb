Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :listings do
    resources :reviews, only: %i[new create]
  end

  resources :offers, only: [:index, :show, :new, :create, :update, :destroy] do
    member do
      put :accept_offer
    end
  end
end
