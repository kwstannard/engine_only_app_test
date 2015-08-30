Rails.application.routes.draw do
  resources :bikes, only: [:index]
end
