class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :votings, :class_name => 'CommentVoting'
  validates :body, :presence => true
  attr_accessible :body, :user_id
end
