require 'rails_helper'

RSpec.describe Relationship, type: :model do
  ### Associations
  it { is_expected.to belong_to(:follower) }
  it { is_expected.to belong_to(:followed) }

  ### Validations
  it { is_expected.to validate_presence_of(:follower_id) }
  it { is_expected.to validate_presence_of(:followed_id) }

  ### Methods
  describe ".find_relationship(follower_id, followed_id)" do
    it "should find the relationship object of two users" do
      relationship = create(:relationship)
      follower = relationship.follower
      followed = relationship.followed

      expect(Relationship.find_relationship(follower.id, followed.id)).
        to be_a(Relationship)
    end
  end
end
