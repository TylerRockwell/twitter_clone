Rails.application.routes.draw do
  get 'profile/:username' => 'users#show', as: :profile
  resources :relationships, only: [:create, :destroy]
  resources :posts do
    member do
      post 'favorite'
      delete 'unfavorite'
    end
  end
  devise_for :users, :controllers => {registrations: 'users/registrations'}
  root 'posts#index'
end
