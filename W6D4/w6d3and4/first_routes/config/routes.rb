Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/users', to: 'users#index'
  # get '/users/new', to: 'users#new'
  # post '/users', to: 'users#create'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  resources :users, only: [:index, :create, :show, :update, :destroy]
  resources :artworks, only: [:create, :show, :destroy, :update]
  resources :artwork_shares, only: [:create, :destroy, :index]
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]

  resources :users do
    resources :artworks, only: :index
    resources :comments, only: :index
  end

  resources :comments do
    resources :likes, only: :index
  end

  resources :artworks do
      resources :comments, only: :index
      resources :likes, only: :index
  end



end
