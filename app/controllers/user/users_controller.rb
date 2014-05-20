class User::UsersController < User::ApplicationController

  def show
    respond_to do |format|
      format.json {render :json => current_user,root: false}
    end
  end

end
