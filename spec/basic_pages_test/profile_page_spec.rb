require 'rails_helper'
require 'common_methods'

RSpec.feature 'User tries to access profile page', type: :feature do
    before :each do
        visit 'localhost:3000'
    end

    scenario 'when logged in' do
        login_user
        click_on "Account"
        click_on "Profile"
        expect(page).to have_title "LoginTest"
        expect(page).to have_content "LoginTest"
        expect(page).to have_content "Microposts"
    end

    
end