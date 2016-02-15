require 'engine_only_helpers'

module BarEngine
  extend EngineOnlyHelpers
  class Engine < ::Rails::Engine
    isolate_namespace BarEngine
  end
end
