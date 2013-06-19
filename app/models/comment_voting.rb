class CommentVoting < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  attr_accessible :direction, :user_id, :comment_id
  validates :direction, :inclusion => { :in => [0, 1]  }
  validates :comment_id, :presence => true
  validates :user_id, :presence => true, :uniqueness => { :scope => :comment_id }
  scope :up, where(:direction => 1)
  scope :down, where(:direction => 0)
end
