class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :client_id

      t.timestamps
    end
  end
end
