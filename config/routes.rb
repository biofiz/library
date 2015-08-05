Rails.application.routes.draw do
  devise_for :users
  root "books#index"
  resources :books
  resources :comments

  namespace :admin do
    root "books#index"
    resources :books
    resources :users, only: [:index, :edit, :destroy]
  end

end
