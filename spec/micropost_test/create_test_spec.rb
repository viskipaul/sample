require 'rails_helper'
require 'common_methods'
require 'factory_bot_rails'

RSpec.feature 'create_micropost', type: :feature do

    let!(:user) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user, name: "LoginTest1", email: "login1@test.com", password: "login_test1", password_confirmation: "login_test1") }

    before :each do
        visit 'localhost:3000'
    end

    # let!(:user) { Create(:user, name: "LoginTest", email: "login@test.com", password: "login_test", password_confirmation: "login_test") }

    let(:current_time) { Time.now }

    scenario 'succesfully creates micropost without photo' do
        login_user
        click_on 'Home'
        expect(page).to have_field("micropost_content")
        fill_in "micropost_content", with: 'This post is created automatically (testing), at: ' + current_time.to_s
        click_on "Post"
        expect(page).to have_content("Micropost created!")
        expect(page).to have_text("This post is created automatically (testing), at: " + current_time.to_s)
        expect(page).to have_text("less than a minute ago")
    end

    scenario 'succesfully creates micropost with photo' do
        login_user
        click_on 'Home'
        expect(page).to have_field("micropost_content")
        expect(page).to have_field("micropost_picture")
        fill_in "micropost_content", with: 'This post is created automatically (testing), at: ' + current_time.to_s
        attach_file("micropost_picture", Rails.root + 'spec/resources/rails.png')
        click_on "Post"
        # puts page.save_screenshot(full: true)
        binding.pry
        expect(page).to have_content("Micropost created!")
        expect(page).to have_text("This post is created automatically (testing), at: " + current_time.to_s)
        expect(page).to have_text("less than a minute ago")
    end
end