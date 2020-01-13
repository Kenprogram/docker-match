Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :users, only: %i(create)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(index show)
end
