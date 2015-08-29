module FooEngine
  class Car < ActiveRecord::Base
    establish_connection Engine.db_conf
  end
end
