require 'spec_helper'

describe Admin::UsersController do
  include Devise::TestHelpers
  before :each do
    @user_admin= FactoryGirl.create :user, :is_admin => true
    @user = FactoryGirl.create :user, :client => @user_admin.client
  end


  it 'an admin user should see a client\'s user' do
    sign_in @user_admin
    get :show, {:id => @user.id}
    assigns(:user).id.should == @user.id
   
  end

  it 'an admin user should not be able to see another client\'s user' do
    another_client_user = FactoryGirl.create :user
    sign_in @user_admin
    get :show, {:id => another_client_user.id}
    assigns(:user).should == nil
   
  end
end
