require 'spec_helper'

describe User::UsersController do
  include Devise::TestHelpers
  before :each do
    @user = FactoryGirl.create :user
    @client =@user.client
    @sale_item_1 = FactoryGirl.create :sale_item, :client => @client
    @sale_item_2 = FactoryGirl.create :sale_item, :client => @client
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  it 'should return JSON of all the sale items' do
    sign_in @user
    get :show

    parsed_body = JSON.parse(response.body)
    parsed_body['first_name'].should == @user.first_name
    parsed_body['client']['model_id'].should == @client.id
    parsed_body['client']['sale_items'].count.should == @client.sale_items.count
  end
end
