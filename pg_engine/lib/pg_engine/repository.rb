module PgEngine
  module Repository
    def self.included(base)
      base.establish_connection Engine.db_conf
    end
  end
end
