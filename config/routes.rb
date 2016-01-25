Rails.application.routes.draw do
  get 'user/:username' => 'users#show', as: :profile
  resources :relationships, only: [:create, :destroy]
  resources :posts
  resources :favorites, only: [:create, :destroy]
  devise_for :users, :controllers => {registrations: 'users/registrations'}
  root 'posts#index'
end
