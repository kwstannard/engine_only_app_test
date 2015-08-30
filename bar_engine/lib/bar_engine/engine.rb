module BarEngine
  class Engine < ::Rails::Engine
    isolate_namespace BarEngine

    def self.db_conf
      YAML::load(root.join('config/database.yml').read)[Rails.env]
    end
  end
end
