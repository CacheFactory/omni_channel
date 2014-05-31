class Gimbal::Manager
  include HTTParty
  format :json
  base_uri 'https://manager.gimbal.com/api/'

  def initialize token
    @security_token =token
  end

  def regester_beacon ar_beacon
    params ={
        factory_id: ar_beacon.factory_id,
        name: ar_beacon.name,
        latitude: nil,
        longitude: nil,
        #config_id: ar_beacon.id,
        visibility: "public"
    }
    make_request 'beacons/', :post, params 
  end

  protected

  def make_request path, method, params, 
    response = self.class.send(method, 
                               path, 
                               :query => params,
                               :headers => {'AUTHORIZATION' => "Token token=#{@security_token}"})
    return false if response.code != 200
    JSON.parse(response.body)
  end

end