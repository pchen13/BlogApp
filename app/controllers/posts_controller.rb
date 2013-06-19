class PostsController < ApplicationController
    before_filter :get_user, :except => [:counter, :reply, :search]
    before_filter :get_post, :only => [:show, :edit, :update, :upload, :reply]
    before_filter :visit_blog, :except => [:search, :reply]
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
            if params[:image]
                @post.save_image(params[:image])
            end
            redirect_to root_url
        else
            render action: "new"
        end
    end
    def show
        # @post = Post.find(params[:id])
        @comment = Comment.new
    end
    def edit
        # @post = Post.find(params[:id])
        if !@post.owner?(current_user)
            redirect_to :back
        end
    end
    def update
        # @post = Post.find(params[:id])
        if @post.update_attributes(params[:post])
            if params[:image]
                @post.save_image(params[:image])
            end
            redirect_to [@user, @post], notice: 'post was successfully updated.'
        else
            render action: "edit"
        end
    end
    def destroy
        Post.destroy(params[:id])
        redirect_to root_url
    end
    def search
        puts "in search"
        @posts = Post.search(params[:q], params[:user_id])
        if @posts.size > 0
            render :partial => 'list', :content_type => 'text/html'
        else
            render :text => 'No results', :content_type => 'text/html'
        end
    end
    # def upload
    #     @post = Post.find(params[:id])
    # end
    # def upload_process
    #     @post = Post.find(params[:id])
    #     @post.save_image(params[:image])
    #     redirect_to user_post_url(@user, @post)
    # end
    # 
    def reply
        # @post = Post.find(params[:id])
        params[:comment][:user_id] = current_user.id
        @post.comments.create(params[:comment])
        redirect_to @post
    end
    
    private
    def get_user
        begin
            @user = User.find(params[:user_id])
        rescue ActiveRecord::RecordNotFound
            redirect_to :back
        end
    end
    def get_post
        begin
            @post = Post.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to :back
        end
    end
    def visit_blog
        @user.visit(@visit)
    end
end