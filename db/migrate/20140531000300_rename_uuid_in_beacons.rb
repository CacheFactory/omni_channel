class RenameUuidInBeacons < ActiveRecord::Migration
  def change
    rename_column :beacons, :uuid , :factory_id
  end
end
