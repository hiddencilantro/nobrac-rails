class Footprint < ApplicationRecord
  belongs_to :user
  validates :total, :vehicle, :publictransit, :flight, :electricity, :naturalgas, :water, :food, :beverages, :dining, :tobacco, :goods, :services, :recreation, presence: true
end
