class Admin::AdminController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :only_allow_admin

  def only_allow_admin
    if !current_user.is_admin
      redirect_to :root, :alert => {:error => 'You don\'t belong here'}
    end
  end

  
end
