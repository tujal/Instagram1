class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :likes , as: :likable
  has_many :comments, dependent: :destroy
  validates :title, :location, :image, presence: true
end
