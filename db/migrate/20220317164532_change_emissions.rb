class ChangeEmissions < ActiveRecord::Migration[7.0]
  def change
    change_table :emissions do |t|
      t.rename :result, :total
      t.float :vehicle
      t.float :publictransit
      t.float :flight
      t.float :electricity
      t.float :naturalgas
      t.float :water
      t.float :food
      t.float :beverages
      t.float :dining
      t.float :tobacco
      t.float :goods
      t.float :services
      t.float :recreation
    end
  end
end
