class PlantsController < ApplicationController
    before_action :set_plant, only: [:show]
  
    def index
      @plants = Plant.all
      render json: @plants
    end
  
    def show
      render json: @plant
    end
  
    def create
      @plant = Plant.new(plant_params)
  
      if @plant.save
        render json: @plant, status: :created
      else
        render json: @plant.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_plant
      @plant = Plant.find(params[:id])
    end
  
    def plant_params
      params.require(:plant).permit(:name, :image, :price)
    end
  end
  