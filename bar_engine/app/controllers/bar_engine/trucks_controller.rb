module BarEngine
  class TrucksController < ApplicationController
    def index
      @trucks = Truck.all
    end
  end
end
