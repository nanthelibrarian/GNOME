class PlantsController < ApplicationController
  
  def index
    @plants = Plant.all 

  end
  
  def show
    @plant = Plant.find(params[:id])    
  end
  
  def new
    @plant = Plant.new
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def create
    @plant = Plant.new(plant_params)
      if @plant.save
        redirect_to plants_url
      else
        render :new 
      end   
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update_attributes(plant_params)
      redirect_to plant_path(@plant)
    else 
      render :edit
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy 
    redirect_to plants_path 
  end

  private

  def plant_params 
    params.require(:plant).permit(:plant_name, :description, :notes)
  end 

end
