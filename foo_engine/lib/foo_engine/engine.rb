module FooEngine
  class Engine < ::Rails::Engine
    isolate_namespace FooEngine
  end
end
