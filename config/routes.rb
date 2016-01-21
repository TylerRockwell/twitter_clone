Rails.application.routes.draw do
  post 'follow' => 'users#follow'
  delete 'unfollow' => 'users#unfollow'
  get 'profile/:username' => 'users#show', as: :profile
  resources :posts do
    member do
      post 'favorite'
      delete 'unfavorite'
    end
  end
  devise_for :users, :controllers => {registrations: 'users/registrations'}
  root 'posts#index'
end
