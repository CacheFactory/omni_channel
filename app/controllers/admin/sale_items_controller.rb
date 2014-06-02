class Admin::SaleItemsController < Admin::ApplicationController
  def index
    @sale_items =SaleItem.all
  end
end
