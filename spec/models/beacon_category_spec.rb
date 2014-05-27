require 'spec_helper'

describe BeaconCategory do
  it 'should create default categories' do
    BeaconCategory.create_defaults
    BeaconCategory.count.should > 0
    count = BeaconCategory.count
    BeaconCategory.create_defaults
    BeaconCategory.count.should == count #not creating duplicates

  end
end
