class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :blogger, :class_name => 'User'
  attr_accessible :score, :user_id, :blogger_id
  validates :score, :inclusion => {:in => 1..10}
  validates :user_id, :presence => true, :uniqueness => { :scope => :blogger_id }
  validates :blogger_id, :presence => true
end
