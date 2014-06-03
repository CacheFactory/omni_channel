class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token
  belongs_to :client
  serialize :demographic_data, JSON

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/silhouette.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  scope :client , lambda{|client| { :conditions => { :client_id => client.id } }}
  
  def display_name
    "#{first_name} #{last_name}"
  end
 
  private
  
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
