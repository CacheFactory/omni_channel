class Admin::BeaconsController < Admin::ApplicationController
  def index
    @beacons = Beacon.all
  end

  def new
    @beacon = Beacon.create
  end

  def create
    @beacon = Beacon.create beacon_specs

    if @beacon.errors.empty?
      redirect_to admin_beacons_path, :notice => "You have successfully created a beacon" 
    else
      render :action => "new" 
    end
  end

  def beacon_specs
    params.require(:beacon).permit(:name, :uuid,:beacon_category_id).tap do |beacon_specs|
      beacon_specs['client_id'] = current_user.client_id
    end
  end  
end
