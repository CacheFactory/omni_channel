class Admin::UsersController < Admin::ApplicationController
  def show
    @user = User.client(@client).find_by_id params[:id]
  end
end
