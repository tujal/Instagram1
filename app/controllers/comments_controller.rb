class CommentsController < ApplicationController

    def create
        @post =Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user = current_user
        if @comment.save
            redirect_to user_post_path( current_user, @post)
        else
            render 'posts/show'
        end
    end

    def edit
        @post =Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end

    def update
        @post =Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        if @comment.update(comment_params)
            redirect_to user_post_path( current_user, @post)
        else
            render :edit
        end
    end


    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
       if  @comment.destroy
        #   redirect_to user_post_path( current_user, @post)
       end

        redirect_to @post
    end

    private
    def comment_params
        params.require(:comment).permit(:comment)
    end
end
