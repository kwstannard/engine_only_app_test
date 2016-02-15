Rails.application.routes.draw do
  mount FooEngine::Engine, at: 'foo_engine'
end

FooEngine::Engine.routes.draw do
  resources :cars, only: [:index, :create]
end
