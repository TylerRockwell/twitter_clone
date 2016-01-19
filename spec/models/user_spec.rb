require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @new_user = create(:user)
    @other_user1 = create(:user)
    @other_user2 = create(:user)
  end

  ### Associations
  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:following_relationships) }
  it { is_expected.to have_many(:follower_relationships) }
  it { is_expected.to have_many(:following) }
  it { is_expected.to have_many(:followers) }

  ### Validations
  it { is_expected.to validate_presence_of(:username) }

  ### Methods

  describe "#number_of_followers" do
    it "returns the number of followers for a user" do
      expect(@new_user.number_of_followers).to eq(0)
      Relationship.create(follower_id: @other_user1.id, followed_id: @new_user.id)
      expect(@new_user.number_of_followers).to eq(1)
      Relationship.create(follower_id: @other_user2.id, followed_id: @new_user.id)
      expect(@new_user.number_of_followers).to eq(2)
    end
  end

  describe "#number_followed_by_user" do
    it "returns the number followed by a user" do
      expect(@new_user.number_followed_by_user).to eq(0)
      Relationship.create(follower_id: @new_user.id, followed_id: @other_user1.id)
      expect(@new_user.number_followed_by_user).to eq(1)
      Relationship.create(follower_id: @new_user.id, followed_id: @other_user2.id)
      expect(@new_user.number_followed_by_user).to eq(2)
    end
  end

  describe "#is_following?(user_id)" do
    context "when following a given user" do
      it "returns true" do
        Relationship.create(follower_id: @new_user.id, followed_id: @other_user1.id)
        expect(@new_user.is_following?(@other_user1.id)).to eq(true)
      end
    end

    context "when not following a given user" do
      it "returns false" do
        expect(@new_user.is_following?(@other_user2.id)).to eq(false)
      end
    end
  end

end
