class User < ActiveRecord::Base
  validates_presence_of :email, :password
  validates_confirmation_of :password
  
  has_many :messages
  has_many :replies
end
