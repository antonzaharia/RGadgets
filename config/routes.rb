Rails.application.routes.draw do
  
  resources :categories
  resources :items do
    resources :colors, :models, only: [:new, :create, :destroy]
  end


  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    resources :addresses
  end
  root 'statics#home'
  post '/logout', to: 'sessions#destroy'
end
