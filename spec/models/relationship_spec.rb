require 'rails_helper'

RSpec.describe Relationship, type: :model do
  ### Associations
  it { is_expected.to belong_to(:follower) }
  it { is_expected.to belong_to(:followed) }

  ### Validations
  it { is_expected.to validate_presence_of(:follower_id) }
  it { is_expected.to validate_presence_of(:followed_id) }

  ### Methods
  describe ".destroy_relationship(follower_id, followed_id)" do
    it "should destroy the relationship object" do
      relationship = create(:relationship)
      follower = relationship.follower
      followed = relationship.followed

      expect { Relationship.destroy_relationship(follower.id, followed.id) }.
        to change(Relationship, :count).by(-1)
    end
  end
end
