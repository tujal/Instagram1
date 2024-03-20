class Note < ApplicationRecord
  has_many :likes , as: :likable
  belongs_to :user
  validates :note, presence: true

  
end
