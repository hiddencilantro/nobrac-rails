class CreateEmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :emissions do |t|
      t.float :result
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
