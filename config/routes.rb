Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # ROUTES FOR OFFERS
  get '/offers', to: 'offers#index'
  get '/offers/:id', to: 'offers#show'
  post '/listings/:id', to: 'offers#create'
  patch '/offers/:id', to: 'offers#update'
  delete '/offers/:id', to: 'offers#destroy'

end
