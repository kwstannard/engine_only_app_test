module PgEngine
  class Bike < ActiveRecord::Base
    establish_connection Engine.db_conf
  end
end
