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
        respond_to do |format|
            if @comment.update(comment_params)
              format.turbo_stream
              format.html { redirect_to user_post_path( current_user, @post)}
            else
              format.html { render :edit, status: :unprocessable_entity }
            end
          end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
          respond_to do | format |
              format.turbo_stream { render turbo_stream: turbo_stream.remove("comment_#{@comment.id}")}
              format.html { redirect_to user_post_path( current_user, @post)}
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:comment)
   end

   
end
