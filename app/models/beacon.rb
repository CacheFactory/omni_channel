class Beacon < ClientModel
  validates_presence_of [:name, :factory_id] 
  belongs_to :beacon_category
  belongs_to :client

  before_create :regester_beacon

  protected
  def regester_beacon
    return true if Rails.env.test? #should stub this out somehow 
    response = BEACON_MANAGER.regester_beacon self
    if response ==false
      errors.add :base, "Beacon failed to regester with beacon server"
      return false
    end
  end
end
