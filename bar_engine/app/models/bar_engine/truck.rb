module BarEngine
  class Truck < ActiveRecord::Base
    establish_connection BarEngine.db_conf
  end
end
