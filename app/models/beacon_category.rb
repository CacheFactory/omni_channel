class BeaconCategory < ActiveRecord::Base

  def self.create_defaults
    ['produce','meat'].each do |name|
      category = BeaconCategory.find_or_create_by_name(name)
      category.save
    end
  end

end
