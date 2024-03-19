class ReelsController < ApplicationController

    def index
        @reels = Reel.all
    end
    def new
        @reel = current_user.reels.new
    end

    def create
        @reel = current_user.reels.create(reels_params)
        if @reel.save
            flash[:success] = "reel Created Successfully!.."
            redirect_to user_reels_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    def destroy
        @reel = current_user.reels.find(params[:id])
        @reel.destroy
        flash[:danger] = "Reel Destory Successfully!"
        redirect_to user_reels_path
    end

    private
    def reels_params
        params.require(:reel).permit(:video)
    end

end
