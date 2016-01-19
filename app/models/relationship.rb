class Relationship < ActiveRecord::Base
  belongs_to :follower,   class_name: 'User'
  belongs_to :followed,   class_name: 'User'

  validates :follower_id,   presence: true
  validates :followed_id,   presence: true

  def self.destroy_relationship(follower_id, followed_id)
   where('follower_id = ? AND followed_id = ?', follower_id, followed_id).first.destroy
  end
end
