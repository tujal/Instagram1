class LikesController < ApplicationController
def create
    @like = current_user.likes.new(like_params)
    @like.save
    respond_to do |format|
      # format.turbo_stream
      format.html {  redirect_back(fallback_location: root_path) }
    end
end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy 
    respond_to do |format|
      # format.turbo_stream { render turbo_stream: turbo_stream.remove("like_#{@like.id}")}
      format.html {  redirect_back(fallback_location: root_path) }
    end
  end
  private
  def like_params
   params.require(:like).permit(:likable_id, :likable_type)
  end
  
end
