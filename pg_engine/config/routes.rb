Rails.application.routes.draw do
  mount PgEngine::Engine, at: 'pg_engine'
end

PgEngine::Engine.routes.draw do
  resources :bikes, only: [:index]
end
