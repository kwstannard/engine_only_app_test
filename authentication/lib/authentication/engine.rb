require 'devise'

module Authentication
  extend EngineOnlyHelpers

  class Engine < ::Rails::Engine
    isolate_namespace Authentication
  end
end
