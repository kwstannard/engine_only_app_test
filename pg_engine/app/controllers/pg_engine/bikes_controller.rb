module PgEngine
  class BikesController < ApplicationController
    def index
      @bikes = Bike.all
    end
  end
end
