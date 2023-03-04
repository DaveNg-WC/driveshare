Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # nested resources to allow user to create review to the listing
  resources :listings do
    resources :reviews, only: %i[new create index]
  end

  resources :reviews, only: %i[destroy]
end
