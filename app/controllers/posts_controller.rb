class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def show
        @post = Post.find(params[:id])
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

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update
        @post = current_user.posts.find(params[:id])
        if @post.update(posts_params)
            redirect_to root_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy
        redirect_to root_path 
    end

    def search
        query = params[:query]
        @posts = Post.where("location like?", "%#{params[:query]}%")
        render :index
    end

    private
    def posts_params
        params.require(:post).permit(:title, :image, :location, :user_id)
    end

end
