class Comment < ApplicationRecord
  has_many :likes , as: :likable
  belongs_to :user
  belongs_to :post
end
