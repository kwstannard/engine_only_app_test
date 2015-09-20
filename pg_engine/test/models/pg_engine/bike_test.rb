require 'test_helper'

module PgEngine
  class BikeTest < ActiveSupport::TestCase
    test "it is stored in the DB" do
      bike = PgEngine::Bike.create(make: 'huffy', model: 'road')
      last_bike = PgEngine::Bike.last
      assert bike == last_bike
    end
  end
end
