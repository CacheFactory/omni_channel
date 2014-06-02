class Admin::ShoppingListItemsController < Admin::ApplicationController
  def index
    @shopping_list_items = ShoppingListItem.all
  end
end
