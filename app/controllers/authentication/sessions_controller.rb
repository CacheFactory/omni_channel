class Authentication::SessionsController < DeviseController
  layout 'login'
  prepend_before_filter :require_no_authentication, :only => [:create ]
  skip_before_filter  :verify_authenticity_token
  before_filter :ensure_params_exist
 
  respond_to :json
  
  def create
    resource = User.find_for_database_authentication(:email=>login_params[:email])
    return invalid_login_attempt unless resource
 
    if resource.valid_password?(login_params[:password]) || (resource.fb_token  && resource.fb_token == login_params[:fb_token])
      sign_in(:user, resource)
      render :json=> resource
      return
    end
    invalid_login_attempt
  end
  
  def destroy
    sign_out(resource_name)
  end
 
  protected
  def ensure_params_exist
    return unless login_params[:email].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end
 
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end

  def login_params
    params.require(:user).permit(:email,:password,:fb_token)
  end
end