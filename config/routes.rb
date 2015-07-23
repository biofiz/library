Rails.application.routes.draw do
  root "home#index"

  namespace :admin do
    resources :books
  end

end
