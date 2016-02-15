Rails.application.routes.draw do
  mount BarEngine::Engine, at: 'bar_engine'
end

BarEngine::Engine.routes.draw do
  resources :trucks, only: [:index]
end
