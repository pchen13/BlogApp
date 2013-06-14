class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :blogger, :class_name => 'User'
  attr_accessible :score, :user_id, :blogger_id
end
