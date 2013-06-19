class BlogVoting < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  attr_accessible :direction, :blog_id, :user_id
  validates :direction, :inclusion => { :in => [0, 1]  }
  validates :blog_id, :presence => true
  validates :user_id, :presence => true, :uniqueness => { :scope => :blog_id }
  # need to validate blog_id and user_id matches in blog=>users, users tables
  scope :up, where(:direction => 1)
  scope :down, where(:direction => 0)
end
