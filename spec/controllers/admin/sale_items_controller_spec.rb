require 'spec_helper'

describe Admin::SaleItemsController do
  include Devise::TestHelpers
  before :each do
    @user= FactoryGirl.create :user, :is_admin => true
    @sale_item = FactoryGirl.create :sale_item, :client => @user.client
  end


  it 'an admin user should be able to view his client' do
    sign_in @user
    get :index
    assigns(:sale_items).count.should ==1
    assigns(:sale_items).include?(@sale_item).should == true
  end
end
