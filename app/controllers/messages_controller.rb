class MessagesController < ApplicationController
    def create
        @group =Group.find(params[:group_id])
        @group = @group.messages.create(messages_params)
        @group.user = current_user
        if @group.save
            redirect_to user_group_path( current_user, @group)
        else
            render 'groups/show'
        end
    end


    private
    def messages_params
        params.require(:message).permit(:message)
   end


end
