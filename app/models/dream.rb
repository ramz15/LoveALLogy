class Dream < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  validates :content, :presence => true
  validates :user_id, :presence => true
  
  acts_as_voteable  
end
