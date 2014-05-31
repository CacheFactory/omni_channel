class Admin::BeaconsController < Admin::ApplicationController
  def index
    @beacons = Beacon.all
  end

  def new
    @beacon = Beacon.new
  end

  def create
    @beacon = Beacon.create beacon_params

    if @beacon.errors.empty?
      redirect_to admin_beacons_path, :notice => "You have successfully created a beacon" 
    else
      render :action => "new" 
    end
  end

  def update
    @beacon = Beacon.find params[:id]

    if @beacon.update_attributes(beacon_params)
      redirect_to admin_beacons_path, :notice => "You have succesfully updated your beacon" 
    else
      render :edit
    end
  end

  protected

  def beacon_params
    params.require(:beacon).permit(:name, :factory_id,:beacon_category_id).tap do |beacon_params|
      beacon_params['client_id'] = current_user.client_id
    end
  end  
end
