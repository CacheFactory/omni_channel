class User::ApplicationController < ApplicationController
  before_filter :authenticate_user_from_token!

  def authenticate_user_from_token!
    binding.pry
    user_email = request.headers['HTTP_EMAIL']
    user_auth_token = request.headers['HTTP_AUTHENTICATION_TOKEN']
    user = user_email && User.find_by_email(user_email)
 
    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token,user_auth_token)
      sign_in(:user, user)
    end

  end
  
end
