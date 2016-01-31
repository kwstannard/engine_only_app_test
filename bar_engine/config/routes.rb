Rails.application.routes.draw do
  mount BarEngine::Engine, at: 'bar_engine'
end

BarEngine::Engine.routes.draw do
  namespace :bar_engine do
    resources :trucks, only: [:index]
  end
end
