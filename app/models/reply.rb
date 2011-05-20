class Reply < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
  
  delegate :name, :email, :to => :user, :allow_nil => true
  
  validates_presence_of :user_id
  validates_length_of :body, :minimum => 1, :maximum => 50
end
