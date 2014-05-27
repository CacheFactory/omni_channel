require 'spec_helper'

describe Admin::BeaconsController do
  include Devise::TestHelpers

  before :each do 
    @user = FactoryGirl.create :user, :is_admin => true
  end
  
  it 'should be able to create beacons' do
    sign_in @user
    beacon = FactoryGirl.build :beacon
    post :create, {beacon: beacon.attributes}
    Beacon.unscoped.last.uuid.should == beacon.uuid
  end
end
