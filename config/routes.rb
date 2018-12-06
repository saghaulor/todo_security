Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'todos#index'
  resources :todos, only: [:index, :new, :create, :update, :show]
  resources :sessions, only: [:new, :create]
  resources :users, only: [:show, :update]
  resources :user_avatars, only: [:show]

  match 'todos/:id/complete', to: "todos#destroy", via: [:get, :delete]
  match 'sessions', to: "sessions#destroy", via: :delete
end
