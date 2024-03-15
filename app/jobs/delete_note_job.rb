class DeleteNoteJob < ApplicationJob
  queue_as :default

  def perform(note)
    note.destroy
  end
end
