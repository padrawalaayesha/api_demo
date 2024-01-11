Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  root 'bookmarks#index'
  resources :bookmarks
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  namespace :api do
    resources :users, only: %i[create]
    resources :bookmarks, only: %i[index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
