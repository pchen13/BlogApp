class HomeController < ApplicationController
    def index
        @posts = Post.first(30)
    end
end