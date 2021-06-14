class Garden < ApplicationRecord
  has_many :plots

  # def plants_harvestable_99 ##user story 3
  #   Plant.joins(plots: :garden).where("gardens.id =  #{self.id}").where('plants.days_to_harvest < ?', 100).distinct
  # end

  def harvestable_appearing_most  #extension
    Plant.joins(plots: :garden).where("gardens.id =  #{self.id}").where('plants.days_to_harvest < ?', 100).group('plants.id').select('plants.*, count(plants.id) as appearances').order('appearances desc').distinct
  end

end
