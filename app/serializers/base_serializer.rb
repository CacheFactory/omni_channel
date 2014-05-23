class BaseSerializer < ActiveModel::Serializer
  attributes :model_id
  self.root = false
  
  def model_id
    object.id
  end
end
