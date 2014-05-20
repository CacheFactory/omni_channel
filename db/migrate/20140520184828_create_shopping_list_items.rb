class CreateShoppingListItems < ActiveRecord::Migration
  def change
    create_table :shopping_list_items do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
