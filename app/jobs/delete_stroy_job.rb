class DeleteStroyJob < ApplicationJob
  queue_as :default

  def perform(story)
    puts "Bye bye story"
   story.destroy
  end
end
