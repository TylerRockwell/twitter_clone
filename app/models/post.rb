class Post < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :users_who_favorited, through: :favorites, source: "user"

  validates :user_id, presence: true
  validates :content, length: {maximum: 140}, allow_blank: false

  def author_name
    user.username
  end
end
