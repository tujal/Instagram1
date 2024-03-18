class Story < ApplicationRecord
  has_one_attached :story
  has_many :likes , as: :likable
  belongs_to :user
  validates :story, presence: true
end
