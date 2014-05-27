class User::UsersController < User::ApplicationController

  def show
    #binding.pry
    respond_to do |format|
      format.json {render :json => current_user}
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end

end
