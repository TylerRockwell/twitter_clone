class FavoriteHandler < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true

  def self.destroy_favorite(user_id, post_id)
    favorite = where('user_id = ? AND post_id = ?', user_id, post_id).first
    favorite.destroy if favorite
  end
end
