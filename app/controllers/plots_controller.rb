class PlotsController < ApplicationController

  def index
    @plots = Plot.all
  end

  def destroy   #this destroy could be in plant_plot_controller, but I chose to consolidate a new controller
    PlantPlot.find_by(plant_id: params[:plant_id], plot_id: params[:plot_id]).destroy
  end
end
