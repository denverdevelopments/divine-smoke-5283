class Plot < ApplicationRecord
  validates :size, presence: true
  validates :direction, presence: true
  validates :number, presence: true, numericality: true

  belongs_to :garden

  has_many :plant_plots
  has_many :plants, through: :plant_plots
end
