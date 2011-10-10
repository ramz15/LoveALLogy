class Highlight < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  validates :content, :presence => true
  validates :user_id, :presence => true
  
  default_scope :order => 'highlights.created_at DESC'
end
