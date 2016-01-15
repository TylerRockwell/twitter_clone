require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "GET /posts" do
    context "when not logged in" do
      it "works! (now write some real specs)" do
        get posts_path
        expect(response).to have_http_status(302)
      end
    end
  end
end