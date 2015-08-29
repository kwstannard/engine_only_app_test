Rails.application.routes.draw do

  mount BarEngine::Engine => "/bar_engine"
end
