require 'spec_helper'

describe Authentication::SessionsController do
  include Devise::TestHelpers
  before :each do 
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it 'should be able to login' do
    
    user = FactoryGirl.create :user
    post :create, {:user => {:email => user.email, :password => user.password}}
    response.should be_success
    parsed_user = JSON.parse(response.body)
    parsed_user['user']['authentication_token'].length.should > 0

  end
  
end
