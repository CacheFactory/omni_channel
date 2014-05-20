class UserSerializer < BaseSerializer
  attributes :first_name, :last_name, :email, :authentication_token
  has_one :client

  def authentication_token
    if defined? current_user
      object.authentication_token if current_user == object
    end
  end
end
