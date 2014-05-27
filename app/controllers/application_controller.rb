class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "non_admin_layout"
    else
      "application"
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :fb_token ,:email, :password, :password_confirmation, :remember_me, :referral) }
  end

  

end
