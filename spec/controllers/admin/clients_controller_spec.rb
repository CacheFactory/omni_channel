require "spec_helper"

describe Admin::ClientsController do
  include Devise::TestHelpers

  
  before :each do
    @user= FactoryGirl.create :user, :is_admin => true
    @client=@user.client
    @non_admin_user = FactoryGirl.create :user
  end

  it 'an admin user should be able to view his client' do
    sign_in @user
    get :index
    assigns(:client).should == @client
  end

  it 'a non admin user should not see client details' do
    sign_in @non_admin_user
    get :index
    response.should redirect_to(root_path)
  end


  it 'an admin should be able to edit their client details' do
    sign_in @user
    get :edit, :id => @client.id
    response.should be_success
    assigns(:client).should == @client
  end

  it 'an admin user should be able update his client details' do
    sign_in @user
    new_name = 'jim'
    put :update, {:id => @client.id, :client => {:name => new_name} }
    @client.reload
    @client.name.should == new_name
  end



end


