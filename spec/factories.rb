FactoryBot.define do
    factory :user do
      name { 'LoginTest10'}
      email { "login10@test.com" }
      password { "login_test" }
      password_confirmation { "login_test" }
    end

    
  end

# let!(:user) { FactoryBotRails.create(:user, name: "LoginTest", email: "login@test.com", password: "login_test", password_confirmation: "login_test") }