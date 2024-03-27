class User < ApplicationRecord
  attr_writer :login
  followability
  PASSWORD_REQUIREMENTS = /\A 
  (?=.{8,})
  (?=.*\d)
  (?=.*[a-z])
  (?=.*[A-Z])
  (?=.*[[:^alnum:]])
  /x
  validates :password,format: PASSWORD_REQUIREMENTS, on: :account_setup
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, authentication_keys: [:login]
  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :note, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :reels, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :messages, dependent: :destroy
  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
  def login
    @login || user_name || email
  end

  def self.find_for_database_authentication( warden_conditions)
        conditions = warden_conditions.dup
      if(login = conditions.delete(:login))
                where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value",
                  { value: login.downcase}]).first
      elsif conditions.has_key?(:user_name) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end
end
