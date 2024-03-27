class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end

    def show
        @group = Group.find(params[:id])
    end

    def new
        @group = current_user.groups.new
    end

    def create
        @group = current_user.groups.create(groups_params)
        if @group.save
            flash[:success] = "group Created Successfully!.."
            redirect_to user_groups_path
        else
            render :new, status: :unprocessable_entity
        end
    end


    private
    def groups_params
        params.require(:group).permit(:name, :group_image, :user_id, :bio)
    end


end
