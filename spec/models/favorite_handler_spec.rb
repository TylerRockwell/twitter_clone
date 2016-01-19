require 'rails_helper'

RSpec.describe FavoriteHandler, type: :model do
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
    let!(:favorite) { create(:favorite_handler, user: current_user, post: post) }
    it "should destroy a user favorite" do
      expect { FavoriteHandler.destroy_favorite(current_user.id, post.id) }.
        to change(FavoriteHandler, :count).by(-1)
    end
  end
end
