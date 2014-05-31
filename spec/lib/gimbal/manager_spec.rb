require 'spec_helper'

describe Gimbal::Manager do

  let (:api_key) { ENV['GIMBAL_API_KEY']}
  let (:gimbal) {Gimbal::Manager.new api_key}

  it 'should be able to create a new instance' do
    gimbal = Gimbal::Manager.new api_key
  end
  
  it 'should regester a new beacon' do
    beacon = FactoryGirl.create :beacon
    #gimbal.stub('make_request') { }
    response = gimbal.regester_beacon beacon
  end
  
end

