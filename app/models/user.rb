class User < ActiveRecord::Base
  has_many :posts
  has_many :following_relationships,  class_name:   "Relationship",
                                      foreign_key:  "follower_id",
                                      dependent:    :destroy
  has_many :follower_relationships,  class_name:    "Relationship",
                                      foreign_key:  "followed_id",
                                      dependent:    :destroy

  has_many :following, through: :following_relationships, source: "followed"
  has_many :followers, through: :follower_relationships,  source: "follower"

  has_many :favorite_handlers
  has_many :favorites, through: :favorite_handlers, source: "post"

  validates :username, presence: true, uniqueness: true
  has_attached_file :avatar, styles: {medium: "300x300"}, default_url: "/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def number_of_followers
    followers.count
  end

  def number_followed_by_user
    following.count
  end

  def is_following?(other_user)
    following.include?(other_user)
  end

  def has_favorite?(post)
    favorites.include?(post)
  end
end
