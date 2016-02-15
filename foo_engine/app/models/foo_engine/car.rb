module FooEngine
  class Car < ActiveRecord::Base
    establish_connection FooEngine.db_conf
  end
end
