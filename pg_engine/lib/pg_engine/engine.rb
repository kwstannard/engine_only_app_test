require 'engine_only_helpers'

module PgEngine
  extend EngineOnlyHelpers

  class Engine < ::Rails::Engine
    isolate_namespace PgEngine
  end
end
