class User < ActiveRecord::Base
  validates_presence_of :email, :password
  validates_confirmation_of :password
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  has_many :messages
  has_many :replies
end
