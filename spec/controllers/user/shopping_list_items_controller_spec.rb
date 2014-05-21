require 'spec_helper'

describe User::ShoppingListItemsController do
  include Devise::TestHelpers
  before :each do
    @user = FactoryGirl.create :user
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  it 'a user can add shopping list items' do 
    sign_in @user
    shopping_list_item = FactoryGirl.build :shopping_list_item
    post :create, {:shopping_list_item => {:name => shopping_list_item.name}}
    ShoppingListItem.last.name.should == shopping_list_item.name
  end
end
