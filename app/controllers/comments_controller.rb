class CommentsController < ApplicationController
  before_filter :get_comment, :except => :vote
  def vote
    CommentVoting.create!(:direction => params[:direction], :comment_id => params[:id], :user_id => current_user.id)
    render :text => 'sucess', :status => 200
    rescue ActiveRecord::RecordInvalid
      render :text => 'fail', :status => 400
  end
  def get_vote_up
    render :text => @comment.votings.up.count, :status => 200
  end
  def get_vote_down
    render :text => @comment.votings.down.count, :status => 200
  end
  
  private
  def get_comment
    begin
      @comment = Comment.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
    end
  end
end
