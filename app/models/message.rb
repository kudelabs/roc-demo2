class Message < ActiveRecord::Base
  has_many :replies
  belongs_to :user
  
  delegate :name, :email, :to => :user, :allow_nil => true
  
  validates_presence_of :body, :user_id
  validates_length_of :body, :maximum => 140 
  
end
