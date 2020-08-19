require 'rails_helper'
require 'common_methods'

RSpec.feature 'User tries to update profile', type: :feature do
    before :each do
        visit 'localhost:3000'
    end

    scenario 'when not logged in' do
        visit 'localhost:3000/users/102/edit'
        save_screenshot(full: true)
        expect(page).to have_content 'Please log in'
        expect(page).to have_title 'Log in'
    end

    scenario 'with valid information' do
        visit_user_update_page
        save_screenshot(full: true)
        expect(find_field('user_name').value).to eq('LoginTest')
        expect(find_field('user_email').value).to eq('login@test.com')
        expect(find_field('user_password').value).to be_empty
        expect(find_field('user_password_confirmation').value).to eq ''
        fill_in 'user_name', with: 'LoginTest_Updated'
        click_on 'Save changes'
        expect(page).to have_content('Profile updated')
        expect(page).to have_content('LoginTest_Updated')
        click_on 'Account'
        click_on 'Settings'
        expect(find_field('user_name').value).to eq('LoginTest_Updated')
        fill_in 'user_name', with: 'LoginTest'
        click_on 'Save changes'
        expect(page).to have_content('Profile updated')
        expect(page).to have_content('LoginTest')
    end

    scenario 'with blank name' do
        visit_user_update_page
        fill_in 'user_name', with: ''
        click_on 'Save changes'
        expect(page).to have_content "Name can't be blank"
    end

    scenario 'with blank email' do
        visit_user_update_page
        fill_in 'user_email', with: ''
        click_on 'Save changes'
        expect(page).to have_content "Email can't be blank"
        expect(page).to have_content "Email is invalid"
    end

    scenario 'with invalid email' do
        visit_user_update_page
        fill_in 'user_email', with: 'user@t'
        click_on 'Save changes'
        expect(page).to have_content 'Email is invalid'
    end

    scenario 'with mismatching passwords' do
        visit_user_update_page
        fill_in 'user_password', with: 'login_test'
        fill_in 'user_password_confirmation', with: 'logintest'
        click_on 'Save changes'
        expect(page).to have_content "Password confirmation doesn't match Password"
    end

    scenario 'with short password' do
        visit_user_update_page
        fill_in 'user_password', with: 'test'
        fill_in 'user_password_confirmation', with: 'test'
        click_on 'Save changes'
        expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
end