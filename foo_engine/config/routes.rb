Rails.application.routes.draw do
  namespace :foo_engine do
    resources :cars, only: [:index, :create]
  end
end
