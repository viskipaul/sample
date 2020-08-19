require 'rails_helper'
require 'database_cleaner/active_record'
require 'database_cleaner'
#require 'support/database_cleaner'
require 'common_methods'


RSpec.feature 'register', type: :feature do
    #let(:user_count) { User.count }

    before :each do
        visit 'localhost:3000'
        #puts user_count
    end

    scenario 'opens home page' do
        expect(page).to have_title 'Ruby on Rails Tutorial Sample App'
        expect(page).to have_text 'Log in'
    end

    scenario 'visit register page' do
        visit_register_page
        expect(page).to have_title 'Sign up'
        expect(page).to have_field('user_password_confirmation', type: 'password')
    end

    scenario 'registers user' do
        DatabaseCleaner.strategy = :truncation
        DatabaseCleaner.start
        register_user
        expect(page).not_to have_text 'Welcome to the Sample App!'
        expect(page).not_to have_text 'Account'
        DatabaseCleaner.clean
    end
end
