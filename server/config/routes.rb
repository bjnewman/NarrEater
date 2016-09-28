Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepages#index'

  get '/homepages', to: 'homepages#index'
  resources :menus, only: [:index, :create]
  resources :users, only: [ :create, :destroy]
  get '/sessions', to: 'sessions#create'
  get '/sessions', to: 'sessions#destroy'
end
