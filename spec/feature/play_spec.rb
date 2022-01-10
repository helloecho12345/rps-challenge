require 'spec_helper'

# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors
feature 'play a game' do
  before do
    visit '/'
    fill_in 'name', with: 'Bob'
    click_button 'Submit'
  end
  
  scenario 'see the options' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

  scenario 'choose an option' do
    click_button 'Rock'
    expect(page).to have_content 'You chose Rock!'
  end

  scenario 'game chooses an option' do
    click_button 'Rock'
    expect(page).to have_content 'Computer chose Rock!'
  end
end
