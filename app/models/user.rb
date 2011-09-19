class User < ActiveRecord::Base
  validates_presence_of :email, :password
  validates_confirmation_of :password
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  has_many :messages
  has_many :replies
  
  before_create :set_name
  
  
  def self.authenticate(email, password)
    User.find_by_email_and_password(email, password)
  end
  
  protected
  def set_name
    self.name ||= email.split("@").first
  end
end
