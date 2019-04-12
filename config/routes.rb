Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :game_picks
  resources :leagues
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'picks', to: 'game_picks#index', as: 'picks'
  get 'about', to: 'about#about', as: 'about'
  get 'leagues', to: 'leagues#index', as: 'leagues'
end
