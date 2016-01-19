class Relationship < ActiveRecord::Base
  belongs_to :follower,   class_name: 'User'
  belongs_to :followed,   class_name: 'User'

  validates :follower_id,   presence: true, uniqueness: { scope: :followed_id,
    message: "is already linked" }
  validates :followed_id,   presence: true, uniqueness: { scope: :follower_id,
    message: "is already linked" }

  def self.destroy_relationship(follower_id, followed_id)
   where('follower_id = ? AND followed_id = ?', follower_id, followed_id).first.destroy
  end
end
