class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = current_user.posts.new
    end
    
    def create
        @post = current_user.posts.create(posts_params)
        if @post.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def posts_params
        params.require(:post).permit(:title, :image, :location, :user_id)
    end

end
