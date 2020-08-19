require 'rails_helper'
require 'common_methods'

RSpec.feature 'User tries to access help page', type: :feature do
    before :each do
        visit 'localhost:3000'
    end

    scenario 'when logged in' do
        login_user
        click_on "Help"
        expect(page).to have_title "Help"
        expect(page).to have_content "Get help"
    end

    scenario 'when logged out' do
        click_on "Help"
        expect(page).to have_title "Help"
        expect(page).to have_content "Get help"
    end

    
end