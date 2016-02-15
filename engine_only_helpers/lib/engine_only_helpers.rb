require "engine_only_helpers/version"

module EngineOnlyHelpers
  class << self
    def extended(base)
      engine_namespaces << base
    end

    def engine_namespaces
      @engine_namespaces ||= []
    end
  end

  def db_conf
    YAML::load(self::Engine.root.join('config/database.yml').read)[Rails.env]
  end

  def base_db_conf
    YAML::load(self::Engine.root.join('config/database.yml').read)['default']
  end

  class Railtie < Rails::Railtie
    rake_tasks do
      path = File.dirname(__FILE__) + "/tasks/**/*.rake"
      Dir.glob(path).each {|p| load p }
    end
  end
end
