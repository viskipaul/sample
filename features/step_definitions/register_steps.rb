# Feature: Register
#     Scenario: Register with valid information
#         When I go to the register page
#         Given I am not logged in
#         And I fill in fields with valid information
#         And I press Create My Account button
#         Then I should be logged in
#         And I should be on the user home page

When(/^I go to the register page$/) do
    visit root_path
    click_on "Sign up now!"
end

Given(/^I am not logged in$/) do
    expect(page).not_to have_selector(:link_or_button, "Account")
end

And(/^I fill in fields with valid information$/) do
    fill_in 'user_name', with: 'RegisterTest'
    fill_in 'user_email', with: 'register@test.com'
    fill_in 'user_password', with: 'register_password'
    fill_in 'user_password_confirmation', with: 'register_password'
end

And(/^I press Create My Account button$/) do
    find('[name="commit"]').click
end

Then(/^I should be registered and logged in$/) do
    expect(page).to have_title('RegisterTest')
    expect(page).to have_content 'Welcome to the Sample App!'
    expect(page).to have_selector(:link_or_button, "Account")
    expect(page).not_to have_field("user_name")
end

# for unsuccessful register

# Scenario: Register with invalid information
# Given I am not logged in
# When I go to the register page
# And I fill in fields with invalid information
# And I press Create My Account button
# Then I should not be registered and logged in
# And All Error messages should come up

And(/^I fill in fields with invalid information$/) do
    fill_in 'user_name', with: ''
    fill_in 'user_email', with: 'register@t'
    fill_in 'user_password', with: 'reg'
    fill_in 'user_password_confirmation', with: 'regis'
end

Then(/^I should not be registered and logged in$/) do
    expect(page).to have_title('Sign up')
    expect(page).not_to have_selector(:link_or_button, "Account")
    expect(page).to have_field("user_name")
end

And(/^All Error messages should come up$/) do
    expect(page).to have_content "The form contains 4 errors."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Email is invalid"
    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(page).to have_content "Password is too short (minimum is 6 characters)"
end