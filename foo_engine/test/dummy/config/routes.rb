Rails.application.routes.draw do

  mount FooEngine::Engine => "/foo_engine"
end
