module BarEngine
  class Engine < ::Rails::Engine
    isolate_namespace BarEngine

    def self.herp
      'derp'
    end

    def self.db_conf
      YAML::load(root.join('config/database.yml').read)[Rails.env]
    end
    debugger
  end
end
