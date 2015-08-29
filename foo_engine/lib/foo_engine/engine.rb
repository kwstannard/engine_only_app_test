module FooEngine
  class Engine < ::Rails::Engine
    isolate_namespace FooEngine
  def self.db_conf
    YAML::load(root.join('config/database.yml').read)[Rails.env]
  end
  end
end
