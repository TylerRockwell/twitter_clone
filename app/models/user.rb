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

  validates :username, presence: true, uniqueness: true
  has_attached_file :avatar, styles: {medium: "300x300"}, default_url: "/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def already_following(followed_id)
    following.include?(User.find(followed_id))
  end
end
