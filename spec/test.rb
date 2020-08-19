require 'rails_helper'

# RSpec.describe 'google' do
#    it 'visits localhost' do
#        visit 'http://localhost:3000'
#    end 
# end

RSpec.feature 'google', type: :feature do
    it 'visits localhost' do
        visit 'http://localhost:3000'
    end 
end