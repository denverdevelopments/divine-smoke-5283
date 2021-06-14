class Garden < ApplicationRecord
  has_many :plots

  def plants_harvestable_99
    Plant.joins(plots: :garden).where("gardens.id =  #{self.id}").where('plants.days_to_harvest < ?', 100).distinct
  end

  # def most_to_least   #Extension attempt, need to fix count
  #   self.plants.select("plants.*, count(plot.plants) as most_used").order(most_used: :desc)
  # end

end
