module PgEngine
  class Bike < ActiveRecord::Base
    establish_connection PgEngine.db_conf
    self.table_name = 'bikes'
  end
end
