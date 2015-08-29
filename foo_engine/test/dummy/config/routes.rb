Rails.application.routes.draw do

  mount BarEngine::Engine => "/foo_engine"
end
