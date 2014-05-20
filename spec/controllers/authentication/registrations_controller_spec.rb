require 'spec_helper'

describe Authentication::RegistrationsController do
  include Devise::TestHelpers
  before :each do 
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it 'should be able to create a new user account' do
    user = FactoryGirl.build :user
    post :create, {:user => {:email => user.email, :password => user.password, :password_confirmation => user.password}}
    response.should be_success
    created_user = User.last
    created_user.email.should == user.email

  end
  
end
