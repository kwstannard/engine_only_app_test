Rails.application.routes.draw do

  mount PgEngine::Engine => "/pg_engine"
end
