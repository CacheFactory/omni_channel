class User::ShoppingListItemsController < User::ApplicationController
  include JsonModelHandeler

  def create
    @shopping_list_item = ShoppingListItem.create shopping_list_items_params
    create_json_handeler  @shopping_list_item
  end
  
  protected

  def shopping_list_items_params
    ret_params=params.require(:shopping_list_item).permit(:name)
    ret_params[:user_id] = current_user.id
    ret_params
  end
end
