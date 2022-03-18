class FootprintSerializer < ActiveModel::Serializer
  attributes :id, :total, :vehicle, :publictransit, :flight, :electricity, :naturalgas, :water, :food, :beverages, :dining, :tobacco, :goods, :services, :recreation, :date

  def date
    object.created_at.to_date
  end
end
