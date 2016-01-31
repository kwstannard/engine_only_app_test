module FooEngine
  class CarsController < ApplicationController
    def index
      @cars = Car.all
    end

    def create
      Car.create!(params.permit(:make, :model))

      redirect_to action: :index
    end
  end
end
