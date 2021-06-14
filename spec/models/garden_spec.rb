require 'rails_helper'

RSpec.describe Garden do
  before(:each) do
    @garden_1 = Garden.create!(name: 'Turing Community Garden', organic: true)

    @plot_1 = @garden_1.plots.create!(number: 1, size: 'Small', direction: "East")
    @plot_2 = @garden_1.plots.create!(number: 22, size: 'Large', direction: "West")

    @plant_1 = Plant.create!(name: 'Lily', description: "White flower", days_to_harvest: 21)
    @plant_2 = Plant.create!(name: 'Daisy', description: "Small red petals", days_to_harvest: 13)
    @plant_3 = Plant.create!(name: 'Rose', description: "Many thorny stems", days_to_harvest: 110)
    @plant_4 = Plant.create!(name: 'Cactus', description: "Prickly, not much water", days_to_harvest: 45)
    @plant_5 = Plant.create!(name: 'Lemon Tree', description: "Small tree, will bear fruit", days_to_harvest: 212)

    PlantPlot.create!(plant: @plant_1, plot: @plot_1)
    PlantPlot.create!(plant: @plant_2, plot: @plot_1)
    PlantPlot.create!(plant: @plant_3, plot: @plot_1)
    PlantPlot.create!(plant: @plant_4, plot: @plot_2)
    PlantPlot.create!(plant: @plant_1, plot: @plot_2)

    @plot_3 = @garden_1.plots.create!(number: 4, size: 'Medium', direction: "Southwest")
    PlantPlot.create!(plant: @plant_2, plot: @plot_2) ##
    PlantPlot.create!(plant: @plant_2, plot: @plot_3) ##
  end

  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should allow_value([true, false]).for(:organic) }
  end

  describe 'instance methods' do
    # describe '.plants_harvestable_99' do  ##user story 3
    #   it 'names plants taking less than 100 days to harvest, no duplicates' do
    #
    #   expect(@garden_1.plants_harvestable_99).to eq([@plant_1, @plant_2, @plant_4])
    #   end
    # end

    describe '.harvestable_appearing_most' do  ##extension
      it 'sorts harvestable plants by most appearances in garden to fewest' do

      expect(@garden_1.harvestable_appearing_most).to eq([@plant_2, @plant_1, @plant_4])
      end
    end
  end
end
