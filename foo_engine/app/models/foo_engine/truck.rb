module FooEngine
  class Truck < ActiveRecord::Base
    establish_connection Engine.db_conf
  end
end
