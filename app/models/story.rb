class Story < ApplicationRecord
  has_one_attached :story
  has_many :likes , as: :likable
  belongs_to :user
  validate :check_story_type

    private
    def check_story_type
        if story.attached?
            if story.content_type == "application/pdf" || story.content_type =="image/jpg" || story.content_type =="image/png" || story.content_type =="image/jpeg"
                errors.add(:story , "Plz upload mp4 file ")
            end
        else
            errors.add(:story, "Story can't be blank")
        end
    end
end
