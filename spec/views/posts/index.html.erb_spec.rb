require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    @user = create(:user)
    assign(:posts, [
      Post.create!(
        :user => @user,
        :content => "Content"
      ),
      Post.create!(
        :user => @user,
        :content => "Content"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => @user.email, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
