require 'rails_helper'
require 'common_methods'

RSpec.describe 'User tries to log in and', type: :feature do

    let!(:user) { FactoryBot.create(:user) }

    before :each do
        visit 'localhost:3000'
    end

    it 'opens home page' do
        expect(page).to have_title 'Ruby on Rails Tutorial Sample App'
        expect(page).to have_text 'Log in'
    end

    it 'goes to login page' do
        visit_login_page
        expect(page).to have_title 'Log in | Ruby on Rails Tutorial Sample App'
        expect(page).to have_field('session_email', type: 'email')
    end

    it 'signs in' do
        # binding.pry
        login_user
        expect(page).to have_text 'LoginTest'
        expect(page).to have_selector(:link_or_button, "Account")
    end

    it 'enters invalid information' do
        visit_login_page
        fill_in 'session_email', with: 'login@test.com'
        fill_in 'session_password', with: 'logintest'
        find('[name="commit"]').click
        expect(page).to have_content "Invalid email/password combination"
        expect(page).to have_title "Log in"
        expect(page).to have_content "Log in"
        expect(page).to have_field("session_email")
        expect(page).to have_field("session_email")
        expect(page).not_to have_selector(:link_or_button, "Account")
    end
end