require 'spec_helper'

# User story 1
# As a marketeer
# So that I can see my name in lights
# I would like to register my name before playing an online game

feature 'enter player name' do
  scenario 'enter player name and see it' do
    visit '/'
    fill_in 'name', with: 'Bob'
    click_button 'Submit'
    expect(page).to have_content 'Bob'
  end
end
