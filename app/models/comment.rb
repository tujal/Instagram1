class Comment < ApplicationRecord
  has_many :likes , as: :likable, dependent: :destroy
  belongs_to :user
  belongs_to :post
end
