require 'spec_helper'
require 'rails_helper'

describe UserDecorator do
  before(:each) do
    @current_user = create(:user).decorate
    sign_in(@current_user)
  end

  describe "#edit_profile_link" do
    context "user is on their own profile" do
      let(:profile_owner) { @current_user.decorate }
      it "should return an edit profile link" do
        expect(profile_owner.edit_profile_link).to include("Edit your profile")
      end
    end

    context "#user is on another user's profile" do
      let(:profile_owner){ create(:user).decorate }
      it "should return nothing" do
        expect(profile_owner.edit_profile_link).to eq(nil)
      end
    end
  end

  describe "#follow_link" do
    let(:other_user){ create(:user).decorate }
    context "current user is not following another user" do
      it "should return a link to follow the other user" do
        expect(other_user.follow_link).to include("Follow")
      end
    end

    context "current user is following another use" do
      let!(:relationship){ create(:relationship,
        follower_id: @current_user.id,
        followed_id: other_user.id)
      }
      it "should return a link to unfollow the other user" do
        expect(other_user.follow_link).to include("Unfollow")
      end
    end
  end

  describe "#display_number('following' or 'followers')" do
    context "asking for number followed by user" do
      context "user is not following anyone" do
        it "should return 'I am following 0 people.'" do
          expect(@current_user.display_number("following")).to eq('I am following 0 people.')
        end
      end

      context "user is following 1 person" do
        let!(:relationship){ create(:relationship, follower_id: @current_user.id) }
        it "should return 'I am following 1 person.'" do
          expect(@current_user.display_number("following")).to eq('I am following 1 person.')
        end
      end

      context "user is following several people" do
        let!(:relationship){ create_list(:relationship, 25,
          follower_id: @current_user.id)
         }
        it "should return 'I am following 1 person.'" do
          expect(@current_user.display_number("following")).to eq('I am following 25 people.')
        end
      end
    end
  end
end
