class User < ActiveRecord::Base
  has_many :posts
  validates :username, presence: true, uniqueness: true
  has_attached_file :avatar, styles: {medium: "300x300"}, default_url: "/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
