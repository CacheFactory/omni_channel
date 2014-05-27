class ClientModel < ActiveRecord::Base
  self.abstract_class = true
  default_scope -> { where("client_id = ?", ClientScope.client_id)  }

  before_create :set_client_id

  def set_client_id
    self.client_id = $client_id 
  end

  def self.class_display_name
    self.name
  end

  def self.class_display_color
    'grey'
  end

  def self.active #default active
    all
  end


end
