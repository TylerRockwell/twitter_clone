require 'rails_helper'
require 'spec_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "PUT /users" do
    it "updates the user's bio" do
      user = create(:user)
      sign_in user, user

      expect(subject.current_user).to eq(user)
      expect(user.bio).to eq 'Hello'

      put :update, user: {email: "user@example.com",
        current_password: "password", bio: "I updated my profile"}
      binding.pry
      user.reload
      expect(user.bio).to eq "I updated my profile"
    end
  end
end
