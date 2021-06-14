class GardensController < ApplicationController

  def show
    @garden = Garden.find(params[:id])
    # @sorted_plants = @garden.plants_harvestable_99
    @sorted_plants = @garden.harvestable_appearing_most
  end
end
