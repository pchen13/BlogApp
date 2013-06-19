class UsersController < ApplicationController
    before_filter :get_user
    before_filter :visit_blog
    def show
        
    end
    # def rating
    #     @rate = Rating.new
    # end
    # def save_rating
    #     params[:rating][:user_id] = current_user.id
    #     params[:rating][:blogger_id] = params[:id]
    #     @rate = Rating.create(params[:rating])
    #     redirect_to user_url(@user)
    # end
    def rate
        if current_user.id == @user.id
            render :text => "fail", :status => 400
        end
        @rate = Rating.create(:user_id => current_user.id, :blogger_id => params[:id], :score => params[:score])
        if @rate.id.nil?
            render :text => "fail", :status => 400
        else
            render :text => @user.rate, :status => 200
        end
    end
    def vote
        if current_user.id != @user.id
          @vote = BlogVoting.create(:direction => params[:direction], :blog_id => params[:id], :user_id => current_user.id)
          if @vote.id.nil?
              render :text => "fail", :status => 400
          else
              render :text => 'sucess', :status => 200
          end
        end
    end
    def get_rating
        render :text => @user.rate, :status => 200
    end
    def get_vote_up
        render :text => @user.votings.up.count, :status => 200
    end
    def get_vote_down
        render :text => @user.votings.down.count, :status => 200
    end
    def visits
        render :text => @user.visits.count, :status => 200
    end
    private
    def get_user
        begin
            @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to root_url
        end
    end
    def visit_blog
        @user.visit(@visit)
    end
end