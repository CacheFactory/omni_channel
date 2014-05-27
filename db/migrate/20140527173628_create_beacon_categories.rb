class CreateBeaconCategories < ActiveRecord::Migration
  def change
    create_table :beacon_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
