Rails.application.routes.draw do
  get 'users/create'

  get 'users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepages#index'

  get '/homepages', to: 'homepages#index'
  resources :menus, only: [:index, :create]
  resources :users, only: [ :create, :destroy]
  resources :session, only: [:create, :destroy]
end
