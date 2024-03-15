class Story < ApplicationRecord
  has_one_attached :story
  belongs_to :user
  validates :story, presence: true
end
