class Post < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :content, length: {maximum: 140}, allow_blank: false
end
