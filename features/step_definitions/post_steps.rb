Given(/^I create a post that says "(.*?)"$/) do |content|
  FactoryGirl.create(:post, user_id: 1, content: content)
end

Given(/^Another user makes a post that says "(.*?)"$/) do |content|
  user = FactoryGirl.create(
    :user,
    username:"zorldo",
    email: "zorldo@example.com",
    password: "password"
    )
  FactoryGirl.create(:post, user: user, content: content)
end

When(/^I edit my post to say "(.*?)"$/) do |content|
  visit 'posts/1/edit'
  expect(page).to have_content("Editing Post")
  fill_in 'Content', with: content
  click_button 'Update Post'
end

When(/^Another user makes a post$/) do
  FactoryGirl.create(:post, user_id: 5, content: content)
end

Then(/^I cannot edit that post$/) do
  visit 'posts/1/edit'
  expect(page).to have_content("You do not have permission")
end

Then(/^my post should be changed to say "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end
