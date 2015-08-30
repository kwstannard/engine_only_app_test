class CarsController < ApplicationController
  def index
    @bikes = Car.all
  end
end
