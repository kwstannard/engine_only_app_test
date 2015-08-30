module PgEngine
  class Bike < ActiveRecord::Base
    include Repository
    self.table_name = 'bikes'
  end
end
