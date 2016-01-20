Given(/^I am logged in with email "(.*?)" and password "(.*?)"$/) do |email, password|
  FactoryGirl.create(:user, username: "user", email: email, password: password)
  visit '/users/sign_in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
  expect(page).to have_content 'Your Feed'
end

When(/^I visit my profile page$/) do
  visit '/profile/user'
end

When(/^I change my bio to "(.*?)"$/) do |bio|
  visit '/users/edit'
  fill_in 'Current password', with: 'password'
  fill_in 'Bio', with: bio
  click_button 'Update'
end

When(/^I visit the profile of "(.*?)"$/) do |username|
  FactoryGirl.create(:user, username: username, email: "#{username}@example.com")
  visit "/profile/#{username}"
end


Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should see my bio has been updated to "(.*?)"$/) do |new_bio|
  visit '/profile/user'
  expect(page).to have_content(new_bio)
end
