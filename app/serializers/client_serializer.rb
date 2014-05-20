class ClientSerializer < BaseSerializer
  attributes :name
  has_many :sale_items
end
