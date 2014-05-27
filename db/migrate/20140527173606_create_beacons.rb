class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :uuid
      t.integer :beacon_category_id

      t.timestamps
    end
  end
end
