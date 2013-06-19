class BlogVisit < ActiveRecord::Base
  belongs_to :user
  belongs_to :visit
  attr_accessible :visit_id
end
