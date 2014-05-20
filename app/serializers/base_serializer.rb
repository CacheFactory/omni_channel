class BaseSerializer < ActiveModel::Serializer
  attributes :object_id
  self.root = false
  
  def object_id
    object.id
  end
end
