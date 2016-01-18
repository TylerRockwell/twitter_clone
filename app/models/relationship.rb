class Relationship < ActiveRecord::Base
  belongs_to :follower,   class_name: 'User'
  belongs_to :followed,   class_name: 'User'

  validates :follower_id,   presence: true
  validates :followed_id,   presence: true

  def self.doomed_relationship(follower, followed)
    where('follower_id = ? AND followed_id = ?', follower, followed).first
  end
end
