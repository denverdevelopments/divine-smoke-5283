class GardensController < ApplicationController

  def show
    @garden = Garden.find(params[:id])
    @harvest_plants = @garden.plants_harvestable_99
  end
end
