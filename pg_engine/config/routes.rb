Rails.application.routes.draw do
  namespace :pg_engine do
    resources :bikes, only: [:index]
  end
end
