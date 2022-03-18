class RenameEmissionsToFootprints < ActiveRecord::Migration[7.0]
  def change
    rename_table('emissions', 'footprints')
  end
end
