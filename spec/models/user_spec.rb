require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @current_user = create(:user)
    @other_user1 = create(:user)
    @other_user2 = create(:user)
  end

  describe "associations" do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:following_relationships) }
    it { is_expected.to have_many(:follower_relationships) }
    it { is_expected.to have_many(:following) }
    it { is_expected.to have_many(:followers) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:username) }
  end

  describe "methods" do
    describe "#number_of_followers" do
      context "when the user does not have followers" do
        it "returns 0" do
          expect(@current_user.number_of_followers).to eq(0)
        end
      end
      context "when the user has followers" do
        let!(:relationships) { create_list(:relationship, 20, followed: @current_user) }
        it "returns the number of followers for the user" do
          expect(@current_user.number_of_followers).to eq(20)
        end
      end
    end

    describe "#number_followed_by_user" do
      context "when the user is not following others" do
        it "returns 0" do
          expect(@current_user.number_followed_by_user).to eq(0)
        end
      end
      context "when the user is following others" do
        let!(:relationships) { create_list(:relationship, 37, follower: @current_user) }
        it "returns the number followed by the user" do
          expect(@current_user.number_followed_by_user).to eq(37)
        end
      end
    end

    describe "#is_following?(user_id)" do
      context "when following a given user" do
        let!(:relationship) { create(:relationship, follower: @current_user, followed: @other_user1 ) }
        it "returns true" do
          expect(@current_user.is_following?(@other_user1)).to eq(true)
        end
      end

      context "when not following a given user" do
        it "returns false" do
          expect(@current_user.is_following?(@other_user2)).to eq(false)
        end
      end
    end

    describe "#has_favorite?(post)" do
      context "when a post is not in the user's favorites"
        let!(:post) { create(:post) }

        it "returns false" do
          expect(@current_user.has_favorite?(post)).to eq(false)
        end

      context "when a post is in the user's favorites" do
        let!(:post) { create(:post) }
        let!(:favorite) { create(:favorite_handler, user: @current_user, post: post) }

        it "returns true" do
          expect(@current_user.has_favorite?(post)).to eq(true)
        end
      end
    end
  end
end
