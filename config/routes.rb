Rails.application.routes.draw do

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  
  resources :carts, only: [:show, :update] do
    patch '/completed', to: 'carts#completed'
    resources :cart_items, only: [:create, :destroy]
  end

  resources :categories, only: [:index, :show]
  resources :items do
    resources :colors, :models, only: [:new, :create, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :addresses, only: [:show, :new, :create, :edit, :update]
    resources :carts, only: [:index]
  end
  root 'statics#home'
  get '/analytics', to: 'statics#analytics'
  post '/logout', to: 'sessions#destroy'
  
end
