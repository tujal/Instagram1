class NotesController < ApplicationController
    def index
        @notes = Note.all
    end
    def new
        @note = current_user.build_note
    end

    def create
        @note = current_user.build_note(notes_params)
        if @note.save
            DeleteNoteJob.set(wait: 24.hours).perform_later(@note)
            flash[:success] = "Note Created Successfully!.."
            redirect_to user_notes_path(current_user)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @note = current_user.note
        @note.delete
        flash[:danger] = "Note Destory Successfully!"
        redirect_to user_notes_path
    end

    private
    def notes_params
        params.require(:note).permit(:note)
    end
end
