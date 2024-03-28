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


    def edit
        @group = current_user.groups.find(params[:id])
    end

    def update
        @group = current_user.groups.find(params[:id])
        if @group.update(groups_params)
            redirect_to user_group_path(current_user, @group)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @group = current_user.groups.find(params[:id])
        @group.destroy
        redirect_to  user_groups_path
    end



    private
    def groups_params
        params.require(:group).permit(:name, :group_image, :user_id, :bio)
    end


end
