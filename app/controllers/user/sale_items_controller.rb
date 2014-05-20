class User::SaleItemsController < User::ApplicationController
  def index
    @sale_items = @client.sale_items

    respond_to do |format|
      format.json {render :json => @sale_items,root: false}
    end
  end
end
