Rails.application.routes.draw do
  namespace :bar_engine do
    resources :trucks, only: [:index]
  end
end
