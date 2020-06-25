Rails.application.routes.draw do
  
  resources :colors
  resources :models
  resources :categories
  resources :items
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    resources :addresses
  end
  root 'statics#home'
  post '/logout', to: 'sessions#destroy'
end
