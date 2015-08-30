class TrucksController < ApplicationController
  def index
    @bikes = Truck.all
  end
end
