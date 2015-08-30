Rails.application.routes.draw do
  resources :trucks, only: [:index]
end
