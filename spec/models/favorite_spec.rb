require 'rails_helper'

RSpec.describe Favorite, type: :model do
  ### Associations
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:post) }

  ### Validations
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:post_id) }

  ### Methods
  describe ".find_favorite(user_id, post_id)" do
    let(:current_user) { create(:user) }
    let(:post) { create(:post) }
    let!(:favorite) { create(:favorite, user: current_user, post: post) }
    it "should find a user's particular favorite" do
      expect(Favorite.find_favorite(current_user.id, post.id)).to eq(favorite)
    end
  end
end
