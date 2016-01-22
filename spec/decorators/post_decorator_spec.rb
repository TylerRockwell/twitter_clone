require 'spec_helper'
require 'rails_helper'

describe PostDecorator do
  before(:each) do
    @current_user = create(:user)
    sign_in(@current_user)
  end

  describe "#favorite_icon" do
    let(:post) { create(:post).decorate }
    context "post was favorited by current user" do
      let!(:favorite) {create(:favorite_handler,
        user: @current_user, post: post)}
      it "should return a full heart" do
        expect(post.favorite_icon).to include("glyphicon-heart")
      end
    end

    context "post was not favorited by current user" do
      it "should return an empty heart" do
        expect(post.favorite_icon).to include("glyphicon-heart-empty")
      end
    end
  end

  describe "#edit_icon" do
    context "post was created by current user" do
      let(:post) { create(:post, user: @current_user).decorate }
      it "should return an edit link" do
        expect(post.edit_icon).to include("glyphicon-pencil")
      end
    end

    context "post was not created by current user" do
      let(:post) { create(:post).decorate }
      it "should return nothing" do
        expect(post.edit_icon).to eq(nil)
      end
    end
  end

  describe "#favorites_list" do
    let(:post) { create(:post).decorate }
    context "post has not been favorited" do
      it "should return 'Nobody yet.'" do
        expect(post.favorites_list).to eq("Nobody yet.")
      end
    end

    context "post has been favorited by a user" do
      let!(:favorite) {create(:favorite_handler,
        user: @current_user, post: post)}
      it "should include the user's name" do
        expect(post.favorites_list).to include(@current_user.username)
      end
    end
  end
end
