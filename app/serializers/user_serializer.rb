class UserSerializer < BaseSerializer
  attributes :first_name, :last_name, :email
  has_one :client
end
