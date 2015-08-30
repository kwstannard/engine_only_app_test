module PgEngine
  class Bike < ActiveRecord::Base
    establish_connection Engine.db_conf
    self.table_name = 'bikes'
  end
end
