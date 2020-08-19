require 'rails_helper'
require 'common_methods'

RSpec.feature 'User tries to access users list page', type: :feature do
    before :each do
        visit 'localhost:3000'
    end

    scenario 'when logged in' do
        login_user
        click_on "Users"
        expect(page).to have_title "All users"
        expect(page).to have_content "All users"
    end

    scenario 'when logged out' do
        visit '/users'
        expect(page).to have_title "Log in"
        expect(page).to have_content "Please log in"
    end

    
end