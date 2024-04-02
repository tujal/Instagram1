class UsersController < ApplicationController
    before_action :set_user
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end

    def follow
      current_user.send_follow_request_to(@user)
      respond_to do | format |
        format.turbo_stream
      end
    end
  
    def unfollow
      make_it_a_unfriend_request
      current_user.unfollow(@user)
      # redirect_to profile_path(@user)
    end
  
    def cancel
      current_user.remove_follow_request_for(@user)
      # redirect_to root_path
    end
  
    def accept
      current_user.accept_follow_request_of(@user)
      make_it_a_friend_request
      redirect_to root_path
    end
  
    def decline
      current_user.decline_follow_request_of(@user)
      # redirect_to root_path
    end

    def user_post
      @posts = @user.posts.all
      render 'user_post'
    end
  
    def user_list
      @users = User.all
    end
  
    def request_page
      @requests = @user.follow_requests
    end
    def following
      @users = @user.following
    end
    def followers
      @users = @user.followers
    end
  
    private
    def make_it_a_friend_request
      current_user.send_follow_request_to(@user)
      @user.accept_follow_request_of(current_user)
    end
  
    def make_it_a_unfriend_request
      @user.unfollow(current_user) if @user.mutual_following_with?(current_user)
    end
    def set_user
      @user = User.find(params[:id])
    end
end
