class AddClientIdToBeacons < ActiveRecord::Migration
  def change
    add_column :beacons, :client_id, :integer
  end
end
