Given(/^I am logged in with email "(.*?)" and password "(.*?)"$/) do |email, password|
  @current_user = FactoryGirl.create(:user, username: "user", email: email, password: password)
  visit '/users/sign_in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
  expect(page).to have_content 'Your Feed'
end

When(/^I visit my profile page$/) do
  visit '/user/user'
end

When(/^I change my bio to "(.*?)"$/) do |bio|
  visit '/users/edit'
  fill_in 'Current password', with: 'password'
  fill_in 'Bio', with: bio
  click_button 'Update'
end

When(/^I visit the profile of "(.*?)"$/) do |username|
  FactoryGirl.create(:user, username: username, email: "#{username}@example.com")
  visit "/user/#{username}"
end

When(/^I follow "(.*?)"$/) do |username|
  @other_user = FactoryGirl.create(:user, username: username)
  visit "user/#{@other_user.username}"
  click_link "Follow this user"
end

Then(/^I should see posts from "(.*?)" in my feed$/) do |username|
  FactoryGirl.create(:post, user: @other_user)
  visit "/posts"
  expect(page).to have_content(username)
end


Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should see my bio has been updated to "(.*?)"$/) do |new_bio|
  visit '/user/user'
  expect(page).to have_content(new_bio)
end
