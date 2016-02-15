require 'engine_only_helpers'

module FooEngine
  extend EngineOnlyHelpers
  class Engine < ::Rails::Engine
    isolate_namespace FooEngine
  end
end
