class AddPictureToSaleItems < ActiveRecord::Migration
  def self.up
    add_attachment :sale_items, :picture
  end

  def self.down
    remove_attachment :sale_items, :picture
  end

end
