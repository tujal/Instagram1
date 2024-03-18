class StoriesController < ApplicationController

    def index
        @storys = Story.all
    end
    def new
        @story = current_user.stories.new
    end

    def create
        @story = current_user.stories.create(story_params)
        if @story.save
            DeleteStroyJob.set(wait: 24.hours).perform_later(@story)
            flash[:success] = "Story Created Successfully!.."
            redirect_to   user_stories_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def story_params
        params.require(:story).permit(:story)
    end

end
