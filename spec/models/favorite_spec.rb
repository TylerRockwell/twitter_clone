require 'rails_helper'

RSpec.describe Favorite, type: :model do
  ### Associations
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:post) }

  ### Validations
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:post_id) }

  ### Methods
  describe ".destroy_favorite(user_id, post_id)" do
    let(:current_user) { create(:user) }
    let(:post) { create(:post) }
    let!(:favorite) { create(:favorite, user: current_user, post: post) }
    it "should destroy a user favorite" do
      expect { Favorite.destroy_favorite(current_user.id, post.id) }.
        to change(Favorite, :count).by(-1)
    end
  end
end
