class Reel < ApplicationRecord
  has_one_attached :video
  has_many :likes , as: :likable
  belongs_to :user
  validate :check_video_type

    private
    def check_video_type
        if video.attached?
            if video.content_type == "application/pdf" || video.content_type =="image/jpg" || video.content_type =="image/png" || video.content_type =="image/jpeg"
                errors.add(:video , "Plz upload mp4 file ")
            end
        else
            errors.add(:video, "video can't be blank")
        end
    end
end
