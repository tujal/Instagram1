class Group < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates :name, presence: true
  has_one_attached :group_image
  belongs_to :user
end
