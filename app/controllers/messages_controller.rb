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

    def destroy
        @group = Group.find(params[:group_id])
        @message = @group.messages.find(params[:id])
        @message.destroy
          respond_to do | format |
              format.turbo_stream { render turbo_stream: turbo_stream.remove("message_#{@message.id}")}
              format.html {redirect_to user_group_path( current_user, @group)}
        end
    end


    private
    def messages_params
        params.require(:message).permit(:message)
   end


end
