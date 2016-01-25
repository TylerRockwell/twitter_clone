Given(/^I create a post that says "(.*?)"$/) do |content|
  visit "/posts/new"
  fill_in "Content", with: content
  click_button "Create Post"
  @my_post = Post.last
end

Given(/^Another user makes a post that says "(.*?)"$/) do |content|
  user = FactoryGirl.create(
    :user,
    username:"zorldo",
    email: "zorldo@example.com",
    password: "password"
    )
  @zorldo_post = FactoryGirl.create(:post, user: user, content: content)
end

When(/^I edit my post to say "(.*?)"$/) do |content|
  visit "/posts/#{@my_post.id}/edit"
  expect(page).to have_content("Editing Post")
  fill_in "Content", with: content
  click_button "Update Post"
end

When(/^I try to edit that post$/) do
  visit "/posts/#{@zorldo_post.id}/edit"
end

When(/^I favorite that user's post$/) do
  FactoryGirl.create(:favorite, user: @current_user, post: @zorldo_post)
end

Then(/^I am listed on the post's show page$/) do
  visit "/posts/#{@zorldo_post.id}"
  expect(page).to have_content(@current_user.username)
end


Then(/^I am redirected to my feed$/) do
  expect(page).to have_content("You do not have permission")
  expect(page).to have_content("Your Feed")
end

Then(/^my post should be changed to say "(.*?)"$/) do |content|
  visit "/user/#{@current_user.username}"
  expect(page).to have_content(content)
end
