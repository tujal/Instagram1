class User < ApplicationRecord
  followability
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :note, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :reels, dependent: :destroy
  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

end
