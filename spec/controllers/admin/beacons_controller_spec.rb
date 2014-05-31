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
    Beacon.unscoped.last.factory_id.should == beacon.factory_id
  end

  describe 'should be able to edit a beacon' do
    before :each do 
      sign_in @user
      @beacon = FactoryGirl.create :beacon
      @beacon.client = @user.client
      @beacon.save
    end

    it 'should be able to edit a beacon\'s name' do
      new_name = 'bla'
      @beacon.name = new_name
      put :update, {id: @beacon.id, beacon: @beacon.attributes}
      @beacon.reload
      @beacon.name.should == new_name
    end

    it 'should be able to edit a beacon\'s category' do
      new_category = FactoryGirl.create :beacon_category
      @beacon.beacon_category = new_category
      put :update, {id: @beacon.id, beacon: @beacon.attributes}
      @beacon.reload
      @beacon.beacon_category.should == new_category
    end
  end
  
end
