class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  broadcasts_to :group
end
