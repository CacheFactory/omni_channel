class Admin::ClientsController < Admin::ApplicationController
  def index 
    @client = current_user.client
  end

  def edit
    
  end

  def update
    if @client.update_attributes(client_params)
      redirect_to admin_clients_path, :notice => "You have succesfully updated your location" 
    else
      render :edit
    end
  end

  protected
  def client_params
    params.require(:client).permit(:name)
  end
end
