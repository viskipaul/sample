When(/^I go to the login page$/) do
    @user = User.create(:name => "LoginTest", :email => "login@test.com", :password => "login_test", :password_confirmation => "login_test")
    
    # let!(:user) { Create(:user, name: "LoginTest", email: "login@test.com", password: "login_test", password_confirmation: "login_test") }

    visit root_path
    click_on "Log in"
end

And(/^I fill in email with "login@test.com"$/) do
    fill_in "session_email", with: "login@test.com"
end

And(/^I fill in password with "login_test"$/) do
    fill_in "session_password", with: "login_test"
end

And(/^I press Login$/) do
    find('[name="commit"]').click
end

Then(/^I should be on the user home page$/) do
    expect(page).to have_title "LoginTest"
    expect(page).to have_content "LoginTest"
    expect(page).to have_selector(:link_or_button, "Account")
    expect(page).not_to have_field("session_email")
    expect(page).not_to have_field("session_password")
end

# for login with invalid information

# Scenario: Sign in with invalid credentials
# Given I am not logged in
# When I go to the login page
# And I fill in wrong email and password
# And I press Login
# Then I should be returned on the login page

And(/^I fill in wrong email and password$/) do
    fill_in "session_email", with: "wrong@email.com"
    fill_in "session_password", with: "wrong_password"
end

Then(/^I should be returned on the login page$/) do
    expect(page).to have_title "Log in"
    expect(page).not_to have_selector(:link_or_button, "Account")
    expect(page).to have_field("session_email")
    expect(page).to have_field("session_password")
end