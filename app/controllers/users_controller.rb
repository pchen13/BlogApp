class UsersController < ApplicationController
    before_filter :get_user
    def show
        
    end
    def rating
        @rate = Rating.new
    end
    def save_rating
        params[:rating][:user_id] = current_user.id
        params[:rating][:blogger_id] = params[:id]
        @rate = Rating.create(params[:rating])
        redirect_to user_url(@user)
    end
    def vote
    end
    private 
    def get_user
        @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to root_url
    end
end