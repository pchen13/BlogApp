class PostsController < ApplicationController
    before_filter :get_user, :except => :counter
    def index
        #@posts = Post.all
    end
    def new
        if @user.id != current_user.id
            redirect_to :back
        end
        @post = Post.new
    end
    def create
        @post = @user.posts.create(params[:post])
        if @post
            @post.save_image(params[:image])
            redirect_to root_url
        else
            render action: "new"
        end
    end
    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
    end
    def edit
        if post.owner?(@user)
            @post = Post.find(params[:id])
        else
            redirect_to :back
        end
    end
    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(params[:post])
            if params[:image]
                @post.save_image(params[:image])
            end
            redirect_to @post, notice: 'post was successfully updated.'
        else
            render action: "edit"
        end
    end
    def destroy
        Post.destroy(params[:id])
        redirect_to root_url
    end
    def search
        @posts = Post.search(params[:q])
        if @posts.size > 0
            render :partial => 'list', :content_type => 'text/html'
        else
            render :text => 'No results', :content_type => 'text/html'
        end
    end
    def upload
        @post = Post.find(params[:id])
    end
    def upload_process
        @post = Post.find(params[:id])
        @post.save_image(params[:image])
        redirect_to user_post_url(@user, @post)
    end
    def reply
        @post = Post.find(params[:id])
        params[:comment][:user_id] = current_user.id
        @post.comments.create(params[:comment])
        redirect_to :back
    end
    
    private
    def get_user
        if params[:user_id]
            @user = User.find(params[:user_id])
        else
            @user = current_user
        end
        @user
    end
end