class Reel < ApplicationRecord
  has_one_attached :video
  has_many :likes , as: :likable
  belongs_to :user
end
