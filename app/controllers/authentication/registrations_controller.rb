class Authentication::RegistrationsController < Devise::RegistrationsController
  layout 'login'
  respond_to :json
  skip_before_filter  :verify_authenticity_token
  def create
    user = User.new(user_params)
    if user.fb_token
      #binding.pry
      previous_user = User.find_by_fb_token user.fb_token
      
      if previous_user
        sign_in :user, user
        render :json=> user
        return
      end

      user.password = Devise.friendly_token[0,20]
    end
    #binding.pry
    if user.save
      sign_in :user, user
      #binding.pry
      render :json=> user
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end

  protected 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :fb_token)
  end

end