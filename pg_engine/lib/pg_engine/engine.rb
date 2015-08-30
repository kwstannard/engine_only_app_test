module PgEngine
  class Engine < ::Rails::Engine
    isolate_namespace PgEngine

    def self.db_conf
      YAML::load(root.join('config/database.yml').read)[Rails.env]
    end

    def self.base_db_conf
      YAML::load(root.join('config/database.yml').read)['default']
    end
  end
end
